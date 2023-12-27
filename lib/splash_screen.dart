import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: SplashPainter(_animation!),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller!,
            builder: (BuildContext context, Widget? child) {
              String text = 'Buddy Loan';
              int endIndex = (_controller!.value * text.length).toInt();
              return Text(
                text.substring(0, endIndex),
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class SplashPainter extends CustomPainter {
  final Animation<double> animation;

  SplashPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(1 - animation.value)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    // Draw a circle that animates in size
    canvas.drawCircle(size.center(Offset.zero), size.width * animation.value, paint);
  }

  @override
  bool shouldRepaint(SplashPainter oldDelegate) {
    return oldDelegate.animation.value != animation.value;
  }
}