import 'package:bookly_app_with_clean_architure/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Image.asset(height: 20, AppAssets.logo),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              size: 31,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
