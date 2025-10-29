import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  var pageIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: OnBoardingPageView(
        pageController: pageController,
      )),
      DotsIndicator(
        dotsCount: 2,
        position: pageIndex.toDouble(),
        decorator: DotsDecorator(
          activeColor: AppColor.primaryColor,
          color: pageIndex == 0
              ? AppColor.primaryColor.withAlpha(50)
              : AppColor.primaryColor,
        ),
      ),
      const SizedBox(
        height: 29,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Visibility(
            visible: pageIndex == 1,
            child: CustomButton(onPressed: () {
              // Navigate to next screen
            Navigator.pushReplacementNamed(context, 'auth');
            }, text: 'ابدأ الان')),
      ),
      SizedBox(
        height: pageIndex == 1 ? 42 : 98,
      ),
    ]);
  }
}
