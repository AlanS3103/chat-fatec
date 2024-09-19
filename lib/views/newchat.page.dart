// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NewChatPage extends StatelessWidget {
  const NewChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Chat"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
                color: Color(0xFFF7F7FC),
                borderRadius: BorderRadius.circular(4)),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFFADB5BD)),
                hintText: "Search",
                hintStyle: TextStyle(),
                border: InputBorder.none,
              ),
            ),
          ),
          Flexible(
              child: ListView(
            children: [
              NewChatsItem(
                userName: "Fulano",
                lastSeen: "Online",
                isOnline: true,
              ),
              NewChatsItem(
                userName: "Ciclano",
                lastSeen: "Yesterday",
                isOnline: false,
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class NewChatsItem extends StatelessWidget {
  final String userName;
  final String lastSeen;
  final bool isOnline;

  const NewChatsItem({
    super.key,
    required this.userName,
    required this.lastSeen,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image:
              DecorationImage(image: NetworkImage('https://picsum.photos/200')),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.circle,
              color: isOnline ? Colors.green : Colors.grey,
              size: 12,
            ),
            Icon(
              Icons.circle,
              color: Colors.white,
              size: 14,
            ),
          ],
        ), 
      ),
      title: Text(userName),
      subtitle: Text(lastSeen),
    );
  }
}
