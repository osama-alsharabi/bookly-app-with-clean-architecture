import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/similer_books_list_view_bloc_builder.dart';
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
        const SimilerBooksListViewBlocBuilder(),
        const SizedBox(height: 40),
      ],
    );
  }
}
