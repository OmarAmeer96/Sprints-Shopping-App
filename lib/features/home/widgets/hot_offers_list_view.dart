import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/features/home/widgets/hot_offers_product_item.dart';

class HotOffersListView extends StatelessWidget {
  const HotOffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: HotOffersProductItem(
            image: 'https://picsum.photos/id/${index + 20}/200',
            text: 'Product ${index + 1}',
          ),
        );
      },
    );
  }
}
