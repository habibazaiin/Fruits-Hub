import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Expanded(child: OnBoardingPageView()),
      DotsIndicator(
        dotsCount: 2,
        position: 0,
        decorator: DotsDecorator(
          activeColor: AppColor.primaryColor,
          color: AppColor.primaryColor.withAlpha(50),
        ),
      ),
      const SizedBox(
        height: 29,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButton(onPressed: () {}, text: 'ابدأ الان'),
      ),
      const SizedBox(
        height: 42,
      ),
    ]);
  }
}
