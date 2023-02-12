import 'package:flutter/material.dart';

// Titles
const kFlashChatTitle = 'Flash Chat';

// Buttons Labels
const kSignInLabel = 'Sign In';
const kSignUpLabel = 'Sign Up';
const kEmailFieldLabel = 'Enter your email';
const kPasswordFieldLabel = 'Enter your password';
const kSendLabel = 'Send';

// Animations Tags
const kLogoImageTag = 'logo';

// Images Paths
const kLogoImagePath = 'assets/images/logo.png';

// Firebase Firestore Keys
const kMessagesKey = 'messages';
const kMessageKey = 'message';
const kSenderKey = 'sender';
const kTimestampKey = 'timestamp';

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

const kTextFieldDecoration = InputDecoration(
  labelText: kEmailFieldLabel,
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);
