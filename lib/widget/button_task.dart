import 'package:flutter/material.dart';
import 'package:task/widget/text_font.dart';

class ButtonTask extends StatelessWidget {
  const ButtonTask({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      // color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.04),
        child: MaterialButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: color)),
            color: color,
            onPressed: onPressed,
            child: TextFont(
              color: Colors.white,
              font: 20,
              text: text,
            )),
      ),
    );
  }
}
