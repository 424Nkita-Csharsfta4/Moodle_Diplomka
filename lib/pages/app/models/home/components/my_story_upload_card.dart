import 'package:flutter/material.dart';

class StoryUploadCard extends StatelessWidget {
  const StoryUploadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 73,
          width: 73,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey, // Replace with your desired background color
          ),
          child: const Icon(
            Icons.account_circle,
            color: Colors.white, // Replace with your desired icon color
            size: 73, // Replace with your desired icon size
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
