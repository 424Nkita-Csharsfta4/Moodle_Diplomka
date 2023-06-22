import 'package:my_app/pages/app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final VoidCallback onTap;

  // ignore: use_key_in_widget_constructors
  const PostCard({Key? key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors
                        .grey, // Replace with desired color or remove decoration for no background color
                  ),
                  child: const Icon(
                    Icons.account_circle,
                    color: Colors.white, // Replace with desired icon color
                    size: 35, // Replace with desired icon size
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${post.location} • ${post.postTime}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 25,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Text(
                    post.postType.name.capitalizeFirst.toString(),
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 226, 247, 92)),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 10),
            Text(post.description),
            const SizedBox(height: 5),
            Hero(
              tag: post.id,
              child: Container(
                height: 140,
                width: double.maxFinite,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors
                      .grey, // Replace with desired color or remove decoration for no background color
                ),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.05),
                  ),
                  child: const Icon(Icons.attachment, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(
                    'assets/icons/heart.svg'), // Replace with the actual path to the heart icon SVG
                const SizedBox(width: 2),
                Text('${post.likes.toString()}k'),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/icons/chat.svg',
                    height:
                        25), // Replace with the actual path to the chat icon SVG
                const SizedBox(width: 2),
                Text('${post.comments.toString()}k'),
                const Spacer(),
                SvgPicture.asset(
                    'assets/icons/share.svg'), // Replace with the actual path to the share icon SVG
                const SizedBox(width: 5),
                SvgPicture.asset(
                    'assets/icons/saved.svg'), // Replace with the actual path to the saved icon SVG
              ],
            ),
          ],
        ),
      ),
    );
  }
}
