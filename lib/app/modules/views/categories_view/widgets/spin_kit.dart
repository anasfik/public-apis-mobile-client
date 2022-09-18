import 'package:flutter/material.dart';

class SpinKit extends StatefulWidget {
  const SpinKit({super.key});

  @override
  State<SpinKit> createState() => _SpinKitState();
}

class _SpinKitState extends State<SpinKit> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        if (_animation.status == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        } else if (_animation.status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1 - _animation.value),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      },
    );
  }
}
