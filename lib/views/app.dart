// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:chat_fatec/views/chats.page.dart';
import 'package:chat_fatec/views/newaccount.page.dart';
import 'package:flutter/material.dart';

import 'login.page.dart';

class ChatFatecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/login": (context) => LoginPage(),
        "/new-account": (context) => NewAccountPage(),
        "/chat": (context) => ChatsPage(),
      },
      initialRoute: "/login",
    );
  }
}
