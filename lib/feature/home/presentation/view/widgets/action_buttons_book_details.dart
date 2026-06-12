import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ActionButtonsBookDetails extends StatelessWidget {
  const ActionButtonsBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            child: Text("19.99€", style: AppStyle.textStyle18Bold),
          ),
        ),
        Expanded(
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
