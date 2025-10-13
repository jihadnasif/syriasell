import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class BeginTopAuth extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Kcolor().kPrimaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0000800, size.height * 0.0026554);
    path_0.quadraticBezierTo(size.width * 0.5488400, size.height * 0.0015819,
        size.width * 0.7418400, size.height * -0.0026554);
    path_0.cubicTo(
        size.width * 0.7764000,
        size.height * 0.7496045,
        size.width * 0.4510800,
        size.height * 1.0562147,
        size.width * -0.0013600,
        size.height * 0.8326554);
    path_0.quadraticBezierTo(size.width * 0.0026400, size.height * 0.6278531,
        size.width * -0.0000800, size.height * 0.0026554);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);

    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = Kcolor().kSecondaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7371200, size.height * -0.0014689);
    path_1.cubicTo(
        size.width * 0.8192800,
        size.height * 0.0032203,
        size.width * 0.8617200,
        size.height * 0.0014689,
        size.width * 0.9007200,
        size.height * 0.0042938);
    path_1.cubicTo(
        size.width * 0.9571600,
        size.height * 0.6254237,
        size.width * 0.4869600,
        size.height * 1.3070621,
        size.width * 0.0439600,
        size.height * 0.8500000);
    path_1.cubicTo(
        size.width * 0.0463600,
        size.height * 0.8534463,
        size.width * 0.0442400,
        size.height * 0.8557627,
        size.width * 0.0442800,
        size.height * 0.8544633);
    path_1.cubicTo(
        size.width * 0.5585600,
        size.height * 1.0851977,
        size.width * 0.7940800,
        size.height * 0.5040678,
        size.width * 0.7371200,
        size.height * -0.0014689);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
