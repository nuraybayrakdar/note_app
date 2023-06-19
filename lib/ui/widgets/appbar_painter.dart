import 'package:flutter/material.dart';

class AppbarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    Paint paint = Paint();
    Path path = Path();
    paint.shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromARGB(231, 3, 161, 83),
          Color.fromARGB(255, 3, 102, 53),
        ]).createShader(rect);
    path.lineTo(
      0,
      size.height - size.height / 8,
    );
    path.conicTo(size.width / 1.3, size.height, size.width,
        size.height - size.height / 8, 9);
    path.lineTo(size.width, 0);
    canvas.drawShadow(path, const Color.fromARGB(255, 3, 102, 53), 4, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
