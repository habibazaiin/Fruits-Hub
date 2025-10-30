import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'signUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'حساب جديد'),
      body: const SignUpViewBody(),
    );
  }
}