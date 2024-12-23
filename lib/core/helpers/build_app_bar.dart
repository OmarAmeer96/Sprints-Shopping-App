import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/theming/styles.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.deepOrange[200],
    title: Text(
      'Our Products',
      style: Styles.font22AppBar,
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {},
        color: Colors.black,
      ),
    ],
  );
}
