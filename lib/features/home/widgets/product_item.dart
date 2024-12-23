import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/features/home/widgets/product_item_add_to_cart_button.dart';
import 'package:sprints_shopping_app/features/home/widgets/product_item_details.dart';

class BestSellingProductItem extends StatelessWidget {
  const BestSellingProductItem({
    super.key,
    required this.image,
    required this.index,
  });

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: ProductItemAddToCartButton(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ProductItemDetails(index: index),
        ),
      ],
    );
  }
}
