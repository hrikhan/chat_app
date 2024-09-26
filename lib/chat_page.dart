import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, String>> _massage = [];
  //create a varriable
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
        ),
        title: Text("Chat with Hridoy"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              reverse: true, // This shows the latest message at the bottom
              itemCount: _massage.length,
              itemBuilder: (context, index) {
                return massage_view(index);
              },
            ),
          ),
          privatetextfeild()
        ],
      ),
    );
  }

  //create custom widgets

  Widget privatetextfeild() {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textEditingController,
              onSubmitted: _handlesubmitted,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () =>
                          _handlesubmitted(_textEditingController.text),
                      icon: Icon(
                        Icons.send,
                        color: Colors.red,
                      )),
                  hintText: "send massage"),
            ),
          ),
        ],
      ),
    );
  }

  void _handlesubmitted(String text) {
    if (text.isEmpty) {
      return;
    }
    setState(() {
      _massage.insert(0, {'massage': text, 'sender': "user"});
      if (text == "hi" || text == 'Hi' || text == "Hi") {
        _massage.insert(0, {
          "massage": "i am hridoys assistant,how can i help you",
          "sender": 'hridoy'
        });
      }
    });

    _textEditingController.clear();
  }

  Widget massage_view(int index) {
    final bool is_user_massage = _massage[index]['sender'] == "user";
    return Align(
      alignment: is_user_massage ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            is_user_massage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!is_user_massage) ...[
            CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text("h"),
            ),
            SizedBox(
              width: 10,
            ),
          ],
          Container(
              decoration: BoxDecoration(
                  color: is_user_massage ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: is_user_massage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    is_user_massage ? "you" : "Hridoy",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(_massage[index]["massage"]!),
                ],
              )),
          if (is_user_massage) ...[
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('Y'),
            ),
          ],
        ],
      ),
    );
  }
}
