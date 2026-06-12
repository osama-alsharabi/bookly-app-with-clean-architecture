import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    initAnimation();
    navigateToHomeView();
    super.initState();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        context.go("/homeView");
      }
    });
  }

  void initAnimation() {
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
    animationController.dispose();

    super.dispose();
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
