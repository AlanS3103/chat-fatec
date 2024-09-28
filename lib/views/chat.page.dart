import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final txtMessage = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  Future<void> sendMessage() async {
    var doc = {
      "uid": user.uid,
      "displayName": user.displayName,
      "timestamp": FieldValue.serverTimestamp(),
      "type": "text",
      "message": txtMessage.text,
    };

    await firestore.collection('messages').add(doc);

    txtMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firestore
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                final documents = snapshot.data!.docs;

                return ListView(
                  children: documents.map((doc) {
                    if (user.uid == doc['uid']) {
                      return SentMessage(
                          doc['message'], doc['timestamp'].toDate());
                    } else {
                      return ReceivedMessage(
                          doc['message'], doc['timestamp'].toDate());
                    }
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7F7FC),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(4)),
                    child: TextField(
                      controller: txtMessage,
                      maxLines: 10,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type your message...",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB9B9B9),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => sendMessage(),
                    icon: Icon(
                      Icons.send,
                      color: Color(0xFF4C4CFF),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  final String message;
  final DateTime timestamp;

  ReceivedMessage(
    this.message,
    this.timestamp,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: 16, right: 60),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            SizedBox(
              height: 4,
            ),
            Text(timestamp.toIso8601String())
          ],
        ),
      ),
    );
  }
}

class SentMessage extends StatelessWidget {
  final String message;
  final DateTime timestamp;

  SentMessage(
    this.message,
    this.timestamp,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, right: 16, left: 60),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFF56E062),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            SizedBox(
              height: 4,
            ),
            Text(timestamp.toIso8601String())
          ],
        ),
      ),
    );
  }
}

class AudioSentMessage extends StatelessWidget {
  const AudioSentMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, right: 16, left: 60),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFF56E062),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("K. Im good Good Morning, did you sleep well? Good Morning, did you sleep well?"),
            Container(
              width: 150,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.6,
                      color: Colors.red,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text("09:45")
          ],
        ),
      ),
    );
  }
}


// LinearProgrssIndicator
