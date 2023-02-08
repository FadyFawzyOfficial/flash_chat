import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/rounded_button.dart';
import 'chat_screen.dart';

class SignInScreen extends StatefulWidget {
  static const name = 'signIn';

  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  late String email, password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: kLogoImageTag,
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset(kLogoImagePath),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (input) => email = input,
                decoration: kTextFieldDecoration,
              ),
              const SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (input) => password = input,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: kPasswordFieldLabel,
                ),
              ),
              const SizedBox(height: 24.0),
              RoundedButton(
                label: kSignInLabel,
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() => showSpinner = true);
                  try {
                    await _firebaseAuth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, ChatScreen.name);
                  } catch (e) {
                    print(e);
                  }
                  setState(() => showSpinner = false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
