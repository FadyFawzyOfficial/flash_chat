import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/chat_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
