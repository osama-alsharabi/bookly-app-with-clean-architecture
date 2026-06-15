import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilerBooksSection extends StatelessWidget {
  const SimilerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "You can also like",
            style: AppStyle.textStyle14SimeBold.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 112,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomBookImage(
                  image: "https://pngimg.com/uploads/book/book_PNG2111.png",
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
