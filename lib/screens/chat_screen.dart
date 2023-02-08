import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatScreen extends StatefulWidget {
  static const name = 'chat';

  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User user;
  late String message;

  @override
  void initState() {
    super.initState();
    currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              messages;
              // _firebaseAuth.signOut();
              // Navigator.pop(context);
            },
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
              stream: _firestore.collection(kMessagesKey).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;
                List<Text> messagesWidget = [];
                for (var message in messages) {
                  final messageText = message.data()[kMessageKey];
                  final messageSender = message.data()[kSenderKey];
                  messagesWidget.add(Text('$messageText from $messageSender'));
                }
                return Column(children: messagesWidget);
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (input) => message = input,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _firestore.collection(kMessagesKey).add({
                      kMessageKey: message,
                      kSenderKey: user.email,
                    }),
                    child: const Text(
                      kSendLabel,
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void get currentUser {
    try {
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        user = currentUser;
        print(currentUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void get messages async {
  //   final messages = await _firestore.collection(kMessagesKey).get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void get messages async {
    await for (var snapshots
        in _firestore.collection(kMessagesKey).snapshots()) {
      for (var message in snapshots.docs) {
        print(message.data());
      }
    }
  }
}
