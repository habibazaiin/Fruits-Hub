import 'package:flutter/material.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView(),
    );
  }
}