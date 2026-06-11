import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        CustomAppBar(),
        SizedBox(height: 20),
        FeatureListView(),
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text("Best Seller", style: AppStyle.textStyle18SimeBold),
        ),
        SizedBox(height: 20),
        BestSellerListView(),
      ],
    );
  }
}
