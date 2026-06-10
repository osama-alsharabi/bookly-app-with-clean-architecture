import 'package:bookly_app_with_clean_architure/core/utils/app_assets.dart';
import 'package:bookly_app_with_clean_architure/feature/splash/presentation/view/widgets/sliding_text_animation.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset(AppAssets.logo), const SlidingTextAnimation()],
    );
  }
}
