// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String word;
  final TextStyle style;
  final double textScaleFactor;

  const AnimatedText({
    required this.word,
    required this.style,
    this.textScaleFactor = 1.0,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late Animation<double> _characterCount;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _characterCount = Tween<double>(
      begin: 0,
      end: widget.word.length.toDouble(),
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (BuildContext context, Widget? child) {
        String text = widget.word.substring(0, _characterCount.value.toInt());
        return Text(
          text,
          style: widget.style,
          textScaleFactor: widget.textScaleFactor,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
