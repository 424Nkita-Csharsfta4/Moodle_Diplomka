import 'package:flutter/material.dart';

class Story {
  String userImage;
  bool isViewed;
  Story({
    required this.userImage,
    required this.isViewed,
  });
}

List<Story> dummyStories = [
  Story(userImage: Icons.person.toString(), isViewed: false),
  Story(userImage: Icons.person.toString(), isViewed: true),
  Story(userImage: Icons.person.toString(), isViewed: true),
];
