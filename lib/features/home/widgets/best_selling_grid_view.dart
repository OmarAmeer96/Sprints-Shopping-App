import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/features/home/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return BestSellingProductItem(
          image: 'https://picsum.photos/id/${index + 10}/200',
          index: index,
        );
      },
    );
  }
}
