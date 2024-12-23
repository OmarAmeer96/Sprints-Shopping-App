import 'package:flutter/material.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({
    super.key,
    required this.groceryImages,
  });

  final List<String> groceryImages;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: groceryImages.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            groceryImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
