import 'package:flutter/material.dart';
import 'package:task/widget/text_font.dart';

class ButtonTaskUpdate extends StatelessWidget {
  const ButtonTaskUpdate({
    super.key,
    required this.text,
    required this.color,
    this.icon,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(bottom: size.height * 0.01, top: size.height * 0.01),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        child: MaterialButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: color)),
            color: Colors.white,
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
                  color: color,
                  font: 20,
                  text: text,
                ),
              ],
            )),
      ),
    );
  }
}
