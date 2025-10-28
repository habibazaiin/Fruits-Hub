import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excucteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgPicture.asset(Assets.assetsImagesPlant)],
          ),
          SvgPicture.asset(Assets.assetsImagesLogo),
          SvgPicture.asset(Assets.assetsImagesSplashBottom, fit: BoxFit.fill),
        ],
      ),
    );
  }

  void excucteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoarding.routeName);
    });
  }
}
