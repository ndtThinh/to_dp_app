import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const AppText(
    this.data, {
    super.key,
    required this.fontSize,
    required this.color,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}