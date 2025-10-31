import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/simple_bloc_observer.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Prefs.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,

      onGenerateRoute: onGenerateRoutes,
      locale: const Locale('ar'),

      // List of delegates that handle loading the translations
      localizationsDelegates: const [
        AppLocalizations.delegate, // Your app's specific translations
        GlobalMaterialLocalizations
            .delegate, // Built-in Material translations (e.g., "OK", "Cancel")
        GlobalWidgetsLocalizations.delegate, // For text direction (RTL/LTR)
        GlobalCupertinoLocalizations.delegate, // For iOS-style widgets
      ],

      // List of languages your app supports (from your .arb files)
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
