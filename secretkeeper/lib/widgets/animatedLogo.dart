import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat(reverse: true);
    _animation = Tween(begin: Offset(0, -0.05), end: Offset(0, 0.05))
        .animate(_animController);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'images/logoBG.png',
          height: 240,
        ),
        SlideTransition(
          position: _animation,
          child: Image.asset(
            'images/logoFG.png',
            height: 200,
          ),
        ),
      ],
    );
  }
}
