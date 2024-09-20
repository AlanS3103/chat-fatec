// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:chat_fatec/views/chat.page.dart';
import 'package:chat_fatec/views/chats.page.dart';
import 'package:chat_fatec/views/newaccount.page.dart';
import 'package:chat_fatec/views/newchat.page.dart';
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
        "/chats": (context) => ChatsPage(),
        "/new-chat": (context) => NewChatPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: "/login",
    );
  }
}
