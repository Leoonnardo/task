import 'package:flutter/material.dart';

import '../color/color_theme.dart';

class PainterCanvasGeneral extends CustomPainter {
  final int canva;
  final Color color;

  PainterCanvasGeneral({required this.canva, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (canva == 1) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.42);
      path.quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.65,
        size.width * 0.5,
        size.height * 0.50,
      );
      path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.45,
        0,
        size.height * 0.60,
      );
      path.close();
    } else if (canva == 2) {
      // path.moveTo(0, size.height);
      path.moveTo(0, 0);
      // path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.68);
      path.quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.6,
        size.width * 0.5,
        size.height * 0.7,
      );
      path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.80,
        0,
        size.height * 0.7,
      );
      path.close();
    } else if (canva == 3) {
      // path.moveTo(0, size.height);
      path.moveTo(0, 0);
      // path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.8);
      path.quadraticBezierTo(
        size.width * 0.75,
        size.height * 1,
        size.width * 0.5,
        size.height * 0.88,
      );
      path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.76,
        0,
        size.height * 0.9,
      );
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PainterCanvasGeneral oldDelegate) => false;
}

AppBar appBarGeneral(Size size, ColorPrimary color, context) {
  return AppBar(
    toolbarHeight: size.height * 0.11,
    elevation: 0,
    backgroundColor: Colors.transparent.withOpacity(0),
    flexibleSpace: SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: PainterCanvasGeneral(canva: 3, color: color.primary90),
            size: Size.infinite,
          ),
          CustomPaint(
            painter: PainterCanvasGeneral(canva: 2, color: color.primary60),
            size: Size.infinite,
          ),
          CustomPaint(
            painter: PainterCanvasGeneral(canva: 1, color: color.primary40),
            size: Size.infinite,
          ),
        ],
      ),
    ),
    leading: Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    ),
  );
}
