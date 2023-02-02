import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.name,
      routes: {
        WelcomeScreen.name: (context) => const WelcomeScreen(),
        SignUpScreen.name: (context) => const SignUpScreen(),
        SignInScreen.name: (context) => const SignInScreen(),
        ChatScreen.name: (context) => const ChatScreen(),
      },
    );
  }
}
