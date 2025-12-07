import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  BestSellingHeader(
                    isHome: false,
                  ),
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
    );
  }
}
