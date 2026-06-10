import 'package:flutter/material.dart';

class SlidingTextAnimation extends StatefulWidget {
  const SlidingTextAnimation({super.key});

  @override
  State<SlidingTextAnimation> createState() => _SlidingTextAnimationState();
}

class _SlidingTextAnimationState extends State<SlidingTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingTransition;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    slidingTransition = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SlideTransition(
          position: slidingTransition,
          child: const Text(
            "Read Free Books",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }
}
