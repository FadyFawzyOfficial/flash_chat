import 'package:animated_text_kit/animated_text_kit.dart';
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

    animationController.forward();

    animationController.addListener(() => setState(() {}));

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(animationController);
  }

  @override
  void dispose() {
    // Even if this screen is dismissed, that controller still lived on, and
    // it's costing resources.
    // So, whenever you're using animation controllers, it's really important
    // that you tap into the dispose method. So when the screen is going to be
    // disposed or when this welcome screen state is going to be destroyed,
    // we have to make sure that we also dispose our controller.
    // So, this way it doesn't end up staying in memory & hogging all the resources.
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
                    height: 60,
                    child: Image.asset(kLogoImagePath),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      kFlashChatTitle,
                      speed: const Duration(milliseconds: 250),
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
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
