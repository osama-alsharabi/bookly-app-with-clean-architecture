import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ActionButtonsBookDetails extends StatelessWidget {
  final BookEntity book;
  const ActionButtonsBookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            borderRadius: const BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            child: Text("${book.price}€", style: AppStyle.textStyle18Bold),
          ),
        ),
        const Expanded(
          child: CustomButton(
            backgroundColor: Color(0xffEF8262),
            foregroundColor: Colors.white,
            borderRadius: BorderRadiusGeometry.only(
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Text("Free preview"),
          ),
        ),
      ],
    );
  }
}
