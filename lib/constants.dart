import 'package:flutter/material.dart';

// Titles
const kFlashChatTitle = 'Flash Chat';

// Buttons Labels
const kSignInLabel = 'Sign In';
const kSignUpLabel = 'Sign Up';

// Animations Tags
const kLogoImageTag = 'logo';

// Images Paths
const kLogoImagePath = 'assets/images/logo.png';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
