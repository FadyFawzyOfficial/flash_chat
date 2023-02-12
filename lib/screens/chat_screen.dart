import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

final _firestore = FirebaseFirestore.instance;
final _firebaseAuth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  static const name = 'chat';

  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  late String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _firebaseAuth.signOut();
              Navigator.pop(context);
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
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: (input) => message = input,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.clear();

                      _firestore.collection(kMessagesKey).add({
                        kMessageKey: message,
                        kSenderKey: userEmail,
                        // Here is the "timestamp" field.
                        kTimestampKey: FieldValue.serverTimestamp(),
                      });
                    },
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
}

String get userEmail {
  try {
    return _firebaseAuth.currentUser?.email ?? '';
  } catch (e) {
    debugPrint('$e');
    rethrow;
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection(kMessagesKey)
          // Here, the ".orderBy" sorts the messages according to the server timestamps.
          .orderBy(kTimestampKey)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageBubbles = [];

        for (var message in messages) {
          final messageText = message.data()[kMessageKey];
          final sender = message.data()[kSenderKey];

          messageBubbles.add(MessageBubble(
            message: messageText,
            sender: sender,
            isMe: sender == userEmail,
          ));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.all(16),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final String sender;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.message,
    required this.sender,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
              topLeft: isMe ? const Radius.circular(30) : Radius.zero,
              topRight: isMe ? Radius.zero : const Radius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
