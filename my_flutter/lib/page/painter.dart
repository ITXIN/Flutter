import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..strokeWidth = 15.0
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..blendMode = BlendMode.exclusion
    ..style = PaintingStyle.fill
    ..colorFilter = ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion)
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0)
    ..filterQuality = FilterQuality.high;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawLine(Offset(50.0, 50.0), Offset(150.0, 50), _paint);
    // canvas.drawLine(Offset(50.0, 100.0), Offset(250.0, 50), _paint);
    // canvas.drawPoints(
    //     PointMode.polygon,
    //     [
    //       Offset(50.0, 350.0),
    //       Offset(50.0, 100),
    //       Offset(150.0, 100),
    //       Offset(150.0, 200)
    //     ],
    //     _paint);
    // // 圆
    // canvas.drawCircle(Offset(200, 120), 100, _paint);
    //椭圆
    // canvas.drawOval(
    //     Rect.fromPoints(Offset(100.0, 100.0), Offset(300.0, 300)), _paint);
    ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        maxLines: 1));

    pb.pushStyle(ui.TextStyle(color: Colors.redAccent));
    pb.addText("text");

    ParagraphConstraints pc = ParagraphConstraints(width: 350);
    Paragraph par = pb.build()..layout(pc);
    canvas.drawParagraph(par, Offset(30, 300));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
