import 'package:flutter/material.dart';

class TextFont extends StatelessWidget {
  const TextFont({
    super.key,
    required this.text,
    required this.color,
    required this.font,
    this.fontWeight,
  });

  final String text;
  final Color color;
  final double font;
  final fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: font, color: color, fontWeight: fontWeight),
    );
  }
}
