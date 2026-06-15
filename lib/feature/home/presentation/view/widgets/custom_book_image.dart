import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String image;
  const CustomBookImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(12),
        child: CachedNetworkImage(fit: BoxFit.fill, imageUrl: image),
      ),
    );
  }
}
