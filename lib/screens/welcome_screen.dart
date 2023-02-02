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
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Make sure that when you are applying a curved animation to your controller
    // that we can't actually have an upperBound that's greater than 1.
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );

    animationController.reverse(from: 1);

    animationController.addListener(() => setState(() {}));
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
                    // But having an animation that goes from 0 to 1 for the size
                    // of our image is not very useful because we won't be able
                    // to see a change between 0 and 1.
                    // So let's multiply that number by 60 to exaggerate the effect.
                    height: animation.value * 60,
                    child: Image.asset(kLogoImagePath),
                  ),
                ),
                const Text(
                  kFlashChatTitle,
                  style: TextStyle(
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
