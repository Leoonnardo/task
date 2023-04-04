import 'package:flutter/material.dart';


class PainterCanvas extends CustomPainter {
  final int canva;
  final Color color;

  PainterCanvas({required this.canva, required this.color});

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
        size.height * 0.58,
        size.width * 0.5,
        size.height * 0.4,
      );
      path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.21,
        0,
        size.height * 0.4,
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
        size.height * 0.76,
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
        size.height * 1.1,
        size.width * 0.5,
        size.height * 0.88,
      );
      path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.76,
        0,
        size.height * 0.95,
      );
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PainterCanvas oldDelegate) => false;
}
