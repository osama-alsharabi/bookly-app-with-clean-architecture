import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/featured_list_view_bloc_builder.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/newest_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: FeaturedListViewBlocBuilder()),
        SliverToBoxAdapter(child: SizedBox(height: 50)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("Best Seller", style: AppStyle.textStyle18SimeBold),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        NewestListViewBlocBuilder(),
      ],
    );
  }
}
