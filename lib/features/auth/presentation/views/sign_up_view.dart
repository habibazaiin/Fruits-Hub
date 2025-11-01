import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'signUpView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'حساب جديد'),
        body: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}

