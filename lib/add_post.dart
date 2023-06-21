import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  final List<String> newsList;

  const AddScreen({Key? key, required this.newsList}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<String> posts = [];

  // ignore: prefer_final_fields
  TextEditingController _postController = TextEditingController();

  void _submitPost() {
    String postContent = _postController.text;

    setState(() {
      posts.add(postContent);
      _postController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить пост'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _postController,
              decoration: const InputDecoration(
                hintText: 'Введите текст поста',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _submitPost,
            child: const Text('Добавить пост'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
