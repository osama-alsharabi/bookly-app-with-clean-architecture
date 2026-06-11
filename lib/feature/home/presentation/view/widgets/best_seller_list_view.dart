
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: BestSellerItem(),
          );
        },
      ),
    );
  }
}
