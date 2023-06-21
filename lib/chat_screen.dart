import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:badges/badges.dart' as badges;

final channel = IOWebSocketChannel.connect('ws://localhost:8080');

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<User> users = [
    User(name: 'Влад Султанов'),
    User(name: 'Стив Работа'),
    User(name: 'Бил Варота'),
  ];
  User? selectedUser;
  Map<User, List<Message>> userMessages = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedUser != null ? selectedUser!.name : 'Чат'),
      ),
      body: Row(
        children: [
          Container(
            width: 200.0,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  onTap: () {
                    setState(() {
                      selectedUser = user;
                    });
                  },
                );
              },
            ),
          ),
          if (selectedUser != null) ...[
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: userMessages[selectedUser]?.length ?? 0,
                      itemBuilder: (context, index) {
                        final message = userMessages[selectedUser]![index];
                        return ListTile(
                          title: Text(message.content),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 1.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.photo),
                          onPressed: () {
                            // Handle photo sending
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.emoji_emotions),
                          onPressed: () {
                            // Handle emoji selection
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              labelText: 'Enter a message',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            // Send message
                            final content = _textController.text;
                            if (selectedUser != null) {
                              final message = Message(
                                  content: content, sender: selectedUser!);
                              channel.sink.add(content);
                              setState(() {
                                if (userMessages.containsKey(selectedUser)) {
                                  userMessages[selectedUser]!.add(message);
                                } else {
                                  // userMessages[selectedUser] = [message];
                                }
                              });
                              _textController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}

class User {
  final String name;

  User({required this.name});
}

class Message {
  final String content;
  final User sender;

  Message({required this.content, required this.sender});
}
