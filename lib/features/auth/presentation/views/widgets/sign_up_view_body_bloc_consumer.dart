import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_hub/core/helper_functions/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          CustomSnackBar.showError(
            context,
            'تم انشاء الحساب بنجاح',
          );
        }
        if (state is SignUpFailure) {
          CustomSnackBar.showError(
            context,
            state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            inAsyncCall: state is SignUpLoading ? true : false,
            child: const SignUpViewBody());
      },
    );
  }
}
