// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final int maxlines;
  const BigText({
    super.key,
    this.color = const Color(0xFFFFFFFF),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxlines,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      ),
    );
  }
}
