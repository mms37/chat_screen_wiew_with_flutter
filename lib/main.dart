import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  List<String> messages = [];

  TextEditingController messageController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      messages.add(message);
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(labelText: 'Mesajınızı girin...'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        _sendMessage(messageController.text);
                      }
                    },
                    child: Text('Gönder'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
