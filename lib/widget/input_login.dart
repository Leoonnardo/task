import 'package:flutter/material.dart';

import '../color/color_theme.dart';

class InputLogin extends StatelessWidget {
  const InputLogin({
    super.key,
    required this.color,
    required this.title,
    required this.titleEnter,
    required this.icon,
  });

  final ColorPrimary color;
  final String title;
  final String titleEnter;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: color.primary40, fontSize: 14),
          ),
          TextField(
            decoration: InputDecoration(
              focusColor: color.primary40,
              prefixIcon: Icon(icon),
              prefixIconColor: color.primary60,
              hintText: titleEnter,
              hintStyle: TextStyle(color: color.primary60, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color.primary60),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color.primary60),
                  borderRadius: BorderRadius.circular(10)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
