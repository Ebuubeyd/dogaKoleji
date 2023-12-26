// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final int maxLines;
  const SmallText({
    super.key,
    this.color = const Color(0xFFFFFFFF),
    required this.text,
    this.size = 12,
    this.height = 1.2,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: size,
      ),
    );
  }
}
