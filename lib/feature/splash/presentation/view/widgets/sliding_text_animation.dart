import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

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
    initAnimation();
    navigateToHomeView();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(milliseconds: 800), () {
      Get.to(
        const HomeView(),
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 500),
      );
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
