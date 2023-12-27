import 'dart:async';
import 'package:flutter/material.dart';

class Splashscreen4 extends StatefulWidget {
  @override
  _ScaleAndBlastAnimationState createState() => _ScaleAndBlastAnimationState();
}

class _ScaleAndBlastAnimationState extends State<Splashscreen4>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.8, 1.0)),
    );

    // Start the animation after a delay
    Timer(Duration(seconds: 2), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_scaleAnimation.value < 2.0)
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  if (_scaleAnimation.value >= 2.0)
                    Opacity(
                      opacity: _fadeAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          ClipOval(
                            child: Image.asset(
                              'assets/images/buddyloan.png',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Buddy Loan',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
