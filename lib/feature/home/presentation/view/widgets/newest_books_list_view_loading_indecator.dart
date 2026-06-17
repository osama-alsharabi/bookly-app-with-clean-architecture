import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/newest_books_item_loading_indectator.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewestBooksListViewLoadingIndecator extends StatelessWidget {
  const NewestBooksListViewLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: NewestBooksItemLoadingIndectator(),
          );
        },
      ),
    );
  }
}
