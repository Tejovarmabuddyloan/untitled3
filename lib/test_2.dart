

import 'package:flutter/material.dart';
class NeoPopTiltedButton extends StatelessWidget {
  final bool isFloating;
  final VoidCallback onTapUp;
  final Color colortop;
  final Color colordge;
  final Color colorbottom;
  final Color colortext;
  NeoPopTiltedButton({
    required this.isFloating,
    required this.onTapUp,
    required this.colortop,
    required this.colordge,
    required this.colorbottom,
    required this.colortext,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) => onTapUp(),
      child: CustomPaint(
        painter: NeoPopTiltedButtonPainter(
          colortop: colortop,
          colordge: colordge,
          colorbottom: colorbottom,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height * 0.04,
          child: Row(
            children: [
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    'Play Quiz & \nWin the Prizes ',
                    style: TextStyle(
                      color: colortext,
                      fontFamily: 'lato',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Icon(
                Icons.arrow_forward_ios,
                color: colortext,
                size: 13,
              )
            ],
          ),
        ),
      ),
    );
  }
}
class NeoPopTiltedButtonPainter extends CustomPainter {
  final Color colortop;
  final Color colordge;
  final Color colorbottom;
  NeoPopTiltedButtonPainter({
    required this.colortop,
    required this.colordge,
    required this.colorbottom,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colortop
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width * 0.2, size.height)
      ..close();
    canvas.drawPath(path, paint);
    final gradient = LinearGradient(
      colors: [colordge, colorbottom],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    paint.shader = gradient.createShader(rect);
    final tiltedPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(tiltedPath, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: NeoPopTiltedButton(
          isFloating: true,
          onTapUp: () {
            // Navigate to quiz description page
            print("Button pressed!");
          },
          colortop: Colors.blue,
          colordge: Colors.lightBlue,
          colorbottom: Colors.blueAccent,
          colortext: Colors.white,
        ),
      ),
    ),
  ));
}