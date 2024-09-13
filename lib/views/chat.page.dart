import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fulano"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              reverse: true,
              children: [
                ReceivedMessage(),
                SentMessage(),
                ReceivedMessage(),
                ReceivedMessage(),
                ReceivedMessage(),
                AudioSentMessage(),
              ],
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
                      maxLines: 10,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Good morning...",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB9B9B9),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
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
  const ReceivedMessage({
    super.key,
  });

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
            Text(
                "Good Morning, did you sleep well? Good Morning, did you sleep well? Good Morning, did you sleep well?"),
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

class SentMessage extends StatelessWidget {
  const SentMessage({
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
            Text(
                "K. Im good Good Morning, did you sleep well? Good Morning, did you sleep well?"),
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
