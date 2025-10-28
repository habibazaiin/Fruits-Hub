import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {

    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
      case OnBoarding.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      );
    // Define your routes here
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      );
  }
}