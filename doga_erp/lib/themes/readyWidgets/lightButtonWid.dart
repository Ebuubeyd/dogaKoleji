// ignore_for_file: file_names

import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/smallTextWid.dart';
import 'package:flutter/material.dart';

class LightButton extends StatefulWidget {
  final Color? color;
  final String buttonText;
  final Function callFunction;
  final double radius;
  final double? width;
  final double? height;
  const LightButton({
    super.key,
    this.color = const Color(0xFF00FFB7),
    required this.buttonText,
    required this.callFunction,
    this.width,
    this.height,
    this.radius = 20,
  });

  @override
  State<LightButton> createState() => _LightButtonState();
}

class _LightButtonState extends State<LightButton> {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = widget.width ?? context.dynamicWidthSmall(1.3);
    double buttonHeight = widget.height ?? context.dynamicHeightSmall(22);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.color,
      ),
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        onPressed: () {
          widget.callFunction();
        },
        child: SmallText(
          text: widget.buttonText,
          color: AppAllColors.darkText,
        ),
      ),
    );
  }
}
