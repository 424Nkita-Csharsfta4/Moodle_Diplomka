import 'package:flutter/material.dart';

import 'package:my_app/pages/app/models/story_model.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({
    Key? key,
    required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: story.isViewed ? Colors.transparent : Colors.blue,
        ),
      ),
      child: Container(
        height: 80,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors
              .grey, // Replace with desired color or remove decoration for no background color
        ),
        child: const Icon(
          Icons.account_circle,
          color: Colors.white, // Replace with desired icon color
          size: 35, // Replace with desired icon size
        ),
      ),
    );
  }
}
