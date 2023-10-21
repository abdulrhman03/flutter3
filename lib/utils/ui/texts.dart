import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Textss extends StatelessWidget {
  final String title;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const Textss(
      {Key? key,
        required this.title,
        this.textColor = Colors.black,
        this.fontWeight,
        this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? 20.sp,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}