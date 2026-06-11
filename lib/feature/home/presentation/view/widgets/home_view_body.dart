import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        CustomAppBar(),
        SizedBox(height: 20),
        FeatureListView(),
      ],
    );
  }
}
