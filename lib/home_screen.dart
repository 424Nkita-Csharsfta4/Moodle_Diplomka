import 'package:flutter/material.dart';

class Post {
  final String username;
  final String text;
  final int likes;
  final int comments;
  final int reposts;

  Post({
    required this.username,
    required this.text,
    required this.likes,
    required this.comments,
    required this.reposts,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(
      username: 'user1',
      text: 'This is the first post',
      likes: 10,
      comments: 5,
      reposts: 2,
    ),
    Post(
      username: 'user2',
      text: 'This is the second post',
      likes: 15,
      comments: 8,
      reposts: 3,
    ),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostItem(post: post);
        },
      ),
    );
  }
}

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool _isLiked = false;
  int _likeCount = 0;
  int _commentCount = 0;
  int _repostCount = 0;

  @override
  void initState() {
    super.initState();
    _likeCount = widget.post.likes;
    _commentCount = widget.post.comments;
    _repostCount = widget.post.reposts;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
    });
  }

  void _incrementCommentCount() {
    setState(() {
      _commentCount++;
    });
  }

  void _incrementRepostCount() {
    setState(() {
      _repostCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.post.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(widget.post.text),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _toggleLike,
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : null,
                ),
              ),
              Text('$_likeCount Likes'),
              IconButton(
                onPressed: _incrementCommentCount,
                icon: const Icon(Icons.comment),
              ),
              Text('$_commentCount Comments'),
              IconButton(
                onPressed: _incrementRepostCount,
                icon: const Icon(Icons.report),
              ),
              Text('$_repostCount Reposts'),
            ],
          ),
        ],
      ),
    );
  }
}
