import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/helpers/build_app_bar.dart';
import 'package:sprints_shopping_app/features/home/widgets/best_selling_grid_view.dart';
import 'package:sprints_shopping_app/features/home/widgets/category_header_section.dart';
import 'package:sprints_shopping_app/features/home/widgets/custom_drawer.dart';
import 'package:sprints_shopping_app/features/home/widgets/home_banner_item.dart';
import 'package:sprints_shopping_app/features/home/widgets/hot_offers_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final List<String> bannerImages = const [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
    'assets/images/image_3.jpg',
    'assets/images/image_4.avif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: HomeBannerItem(groceryImages: bannerImages),
              ),
              const SizedBox(height: 16.0),
              CategoryHeaderSection(
                title: 'Best Selling',
              ),
              const SizedBox(height: 16.0),
              BestSellingGridView(),
              CategoryHeaderSection(
                title: 'Hot Offers',
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 180,
                child: HotOffersListView(),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
