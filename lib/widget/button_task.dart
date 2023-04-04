import 'package:flutter/material.dart';
import 'package:task/widget/text_font.dart';

class ButtonTask extends StatelessWidget {
  const ButtonTask({
    super.key,
    required this.text,
    required this.color,
    this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.colorBorder,
  });

  final String text;
  final Color color;
  final Color? colorBorder;
  final double? width;
  final double? height;
  final icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: SizedBox(
        width: width != null ? size.width * width! : size.width * 0.9,
        height: height != null ? size.height * height! : size.height * 0.07,
        child: MaterialButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorBorder ?? color)),
            color: color,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: icon,
                      ),
                TextFont(
                  color: colorBorder != null ? colorBorder! : Colors.white,
                  font: 20,
                  text: text,
                ),
              ],
            )),
      ),
    );
  }
}
