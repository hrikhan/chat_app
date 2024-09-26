import 'package:flutter/material.dart';

class ChatMassageShow extends StatelessWidget {
  const ChatMassageShow({super.key,required this.text});
    final String text;
  @override
  Widget build(BuildContext context) {
  
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            child: Text("you"),
          ),
        ),
        Column(
          children: [
            Text(
              "you",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(text),
            )
          ],
        )
      ],
    );
  }
}
