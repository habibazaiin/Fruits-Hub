import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }

  
}
