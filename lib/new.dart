import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circular Timer Container Popup')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(context: context, builder: (context) => MyTimerDialog()),
          child: Text('Show Timer Popup'),
        ),
      ),
    );
  }
}

class MyTimerDialog extends StatefulWidget {
  @override
  _MyTimerDialogState createState() => _MyTimerDialogState();
}

class _MyTimerDialogState extends State<MyTimerDialog> {
  int _seconds = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) _seconds--;
        else {
          _timer.cancel();
          Navigator.of(context).pop();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: CircleBorder(),
      content: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CustomPaint(
            painter: TimerPainter(seconds: _seconds),
            child: Center(
              child: Text('$_seconds/30', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final int seconds;

  TimerPainter({required this.seconds});

  @override
  void paint(Canvas canvas, Size size) {
    double percentage = (30 - seconds) / 30.0;
    double sweepAngle = 360 * percentage;
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13.0;
    paint.color = Colors.grey.withOpacity(0.5);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      -90 * (pi / 180),
      360 * (pi / 180),
      false,
      paint,
    );
    if (percentage > 0) {
      if (percentage <= 0.25) {
        paint.color = Colors.green;
      } else if (percentage <= 0.5) {
        paint.color = Colors.yellow;
      } else if (percentage <= 0.75) {
        paint.color = Colors.orange;
      } else {
        paint.color = Colors.red;
      }
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
        -90 * (pi / 180),
        sweepAngle * (pi / 180),
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}