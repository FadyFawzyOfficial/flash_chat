import 'package:flutter/material.dart';

import '../constants.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const name = 'welcome';

  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 100,
    );

    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });
  }

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
            Row(
              children: [
                Hero(
                  tag: kLogoImageTag,
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset(kLogoImagePath),
                  ),
                ),
                Text(
                  '${animationController.value.toInt()}%',
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    SignInScreen.name,
                  ),
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(kSignInLabel),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    SignUpScreen.name,
                  ),
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(kSignUpLabel),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
