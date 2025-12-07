import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/firebase_service_auth.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
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
            mainAxisAlignment: MainAxisAlignment.end,
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
      if (Prefs.getBool(kIsOnBoardingViewSeenSeenKey) ?? false) {
        var isUserLoggedIn = FirebaseServiceAuth().isUserLoggedIn();
        if (isUserLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
          return;
        }
        Navigator.pushReplacementNamed(context, SignInView.routeName);
        return;
      }
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
