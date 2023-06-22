import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

// ignore: unused_import
import 'package:my_app/pages/app/models/profile/components/account_action_chip.dart';
import 'package:my_app/pages/app/models/profile/components/account_info_chips.dart';
import 'package:my_app/pages/app/models/profile/components/follow_chip.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    // Connect to the websocket server
    channel = IOWebSocketChannel.connect('ws://your-websocket-server-url');
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void sendMessage(String message) {
    // Send message to the websocket server
    channel.sink.add(message);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 60, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: const Column(
            children: [
              Text(
                "Никита Булынкин",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AccountInfoChips(
                    info: '16 друзей',
                  ),
                  SizedBox(width: 10),
                  AccountInfoChips(
                    info: '10 подписок',
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FollowChip(),
                ],
              )
            ],
          ),
        ),
        const CircleAvatar(
          radius: 50,
          child: Icon(Icons.account_circle, size: 100),
        ),
      ],
    );
  }
}

class ChatScreen extends StatefulWidget {
  final WebSocketChannel channel;

  const ChatScreen({Key? key, required this.channel}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    widget.channel.sink.close();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      widget.channel.sink.add(_messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Render received messages
                    final messages = snapshot.data as String;
                    return ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = messages[index];
                        return ListTile(
                          title: Text(message),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a message',
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
