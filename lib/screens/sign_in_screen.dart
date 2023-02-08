import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/rounded_button.dart';

class SignInScreen extends StatefulWidget {
  static const name = 'signIn';

  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: kLogoImageTag,
              child: SizedBox(
                height: 200.0,
                child: Image.asset(kLogoImagePath),
              ),
            ),
            const SizedBox(height: 48),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration,
            ),
            const SizedBox(height: 8.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: kPasswordFieldLabel,
              ),
            ),
            const SizedBox(height: 24.0),
            RoundedButton(
              label: kSignInLabel,
              color: Colors.lightBlueAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
