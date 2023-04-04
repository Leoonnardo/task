import 'package:flutter/material.dart';

import '../color/color_theme.dart';

class InputGlobalTask extends StatelessWidget {
  const InputGlobalTask(
      {super.key,
      required this.color,
      this.title,
      required this.titleEnter,
      this.icon,
      this.maxLine,
      this.widht,
      this.height,
      this.textInput,
      this.controller,
      required this.onChanged});

  final ColorPrimary color;
  final title;
  final String titleEnter;
  final icon;
  final maxLine;
  final widht;
  final height;
  final textInput;
  final controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title == null ? "" : title,
          style: TextStyle(color: color.primary40, fontSize: 14),
        ),
        SizedBox(
          width: widht ?? size.width * 0.9,
          height: height,
          child: TextField(
            maxLines: maxLine,
            keyboardType: textInput,
            controller: controller,
            decoration: InputDecoration(
              focusColor: color.primary40,
              prefixIcon: icon,
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
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
