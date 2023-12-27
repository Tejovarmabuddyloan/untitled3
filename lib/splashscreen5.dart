import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Bubble {
  Bubble({required this.controller}) {
    left = Random().nextDouble();
    top = 1.0;
    radius = Random().nextDouble() * 0.02;
    opacity = Random().nextDouble();
    animation = Tween(begin: top, end: -0.1).animate(controller)
      ..addListener(() {
        top = animation.value;
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        }
      });
    controller.forward();
  }
  final AnimationController controller;
  late final Animation<double> animation;
  late double left;
  late double top;
  late double radius;
  late double opacity;
}

class BubbleEffect extends StatefulWidget {
  @override
  _BubbleEffectState createState() => _BubbleEffectState();
}

class _BubbleEffectState extends State<BubbleEffect> with TickerProviderStateMixin {
  final List<Bubble> bubbles = [];

  @override
  void initState() {
    super.initState();
    generateBubble();
  }

  void generateBubble() {
    Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
      if (mounted) {
        setState(() {
          bubbles.add(
            Bubble(controller: AnimationController(duration: Duration(seconds: Random().nextInt(3) + 2), vsync: this)),
          );
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: bubbles.map((bubble) {
        return Positioned.fill(
          top: MediaQuery.of(context).size.height * bubble.top,
          left: MediaQuery.of(context).size.width * bubble.left,
          child: Opacity(
            opacity: bubble.opacity,
            child: Container(
              width: MediaQuery.of(context).size.width * bubble.radius,
              height: MediaQuery.of(context).size.width * bubble.radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Splashscreen5 extends StatefulWidget {
  @override
  _ScaleUpAnimationState createState() => _ScaleUpAnimationState();
}

class _ScaleUpAnimationState extends State<Splashscreen5>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BubbleEffect(),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/buddyloan.png'),
                      Text(
                        'Buddy Loan',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hack',
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}