import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/routes.dart';

class Beginning extends StatefulWidget {
  const Beginning({super.key});

  @override
  State<Beginning> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Beginning>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
    );

    _controller.forward();

    // إذا أردت إضافة الانتقال للصفحة الثانية، أضف هنا:
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoute.rWelcome);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _GreenDiagonalPainter(progress: _animation.value),
          );
        },
      ),
    );
  }
}

class _GreenDiagonalPainter extends CustomPainter {
  final double progress;
  _GreenDiagonalPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;

    double offset = size.width * 0.2 * (1 - progress); // هنا 20%

    final path = Path()
      ..moveTo(size.width - offset, 0) // أعلى يمين مع حركة الانزياح
      ..lineTo(offset, size.height) // أسفل يسار مع حركة الانزياح
      ..lineTo(size.width, size.height) // أسفل يمين
      ..lineTo(size.width, 0) // أعلى يمين
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _GreenDiagonalPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
