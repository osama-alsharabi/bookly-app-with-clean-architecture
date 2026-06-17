import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image_indecator.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/rating_books_loading_indecator.dart';
import 'package:flutter/widgets.dart';

class NewestBooksItemLoadingIndectator extends StatelessWidget {
  const NewestBooksItemLoadingIndectator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
      child: Row(
        children: [
          CustomBookImageIndecator(),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "loading Indecator alkdfjadfl a;ldjf aldsfj alsdfj aldfkj",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 3),
                Text(
                  "ja;lkdfja;sldfj",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text("a;lsdkfjas€"),
                    Spacer(),
                    RatingBooksLoadingIndecator(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
