import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_search_text_field.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
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
                    SizedBox(
                      height: 12,
                    ),
                    BestSellingHeader(),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              BestSellingGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
