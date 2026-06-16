import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image_indecator.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedListViewLoadingIndcator extends StatelessWidget {
  const FeaturedListViewLoadingIndcator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Skeletonizer( 
        enabled: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomBookImageIndecator(),
            );
          },
        ),
      ),
    );
  }
}
