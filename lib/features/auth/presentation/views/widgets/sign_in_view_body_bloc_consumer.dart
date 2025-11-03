import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/Sign_in_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          CustomSnackBar.showError(
            context,
            'تم تسجيل الدخول بنجاح',
          );
        }
        if (state is SignInFailure) {
          CustomSnackBar.showError(
            context,
            state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            inAsyncCall: state is SignInLoading ? true : false,
            child: const SignInViewBody());
      },
    );
  }
}
