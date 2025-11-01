import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'auth';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'تسجيل الدخول'),
        body: const LoginViewBody(),
      ),
    );
  }
}
