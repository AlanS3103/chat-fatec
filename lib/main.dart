import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'views/app.dart';

import 'package:firebase_core/firebase_core.dart';

// const options = FirebaseOptions(
//     apiKey: "AIzaSyC6-jGEx0b4Ukt0egXcJEidddLaiBzRnt8",
//     authDomain: "chat-fatec-ee585.firebaseapp.com",
//     projectId: "chat-fatec-ee585",
//     storageBucket: "chat-fatec-ee585.appspot.com",
//     messagingSenderId: "1046072705615",
//     appId: "1:1046072705615:web:f30382fd0145f82dab603a");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options: options);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatFatecApp());
}
