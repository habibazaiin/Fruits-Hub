import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    CustomHomeAppBar(),
                    SizedBox(
                      height: 16,
                    ),
                    CustomSearchTextField(),
                    SizedBox(
                      height: 12,
                    ),
                    FeaturedItemList(),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
