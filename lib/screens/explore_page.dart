// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:yummy/components/category_section.dart';
import 'package:yummy/components/post_section.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  // 1
  final mockService = MockYummyService();
  ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: Add Listview Future Builder
    // 2
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          // TODO: Replace this with Restaurant Section
          // TODO: Wrap in a ListView
          // 1
          return ListView(
            // 2
            shrinkWrap: true,
            // 3
            scrollDirection: Axis.vertical,
            // 4
            children: [
              RestaurantSection(restaurants: restaurants),
              // TODO: Add CategorySection
              CategorySection(categories: categories),
              // TODO: Add PostSection
              PostSection(posts: posts),
            ],
          );
        } else {
          // 6
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
