import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const CustomTextFormField(
            hintText: 'البريد الالكترونى',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'كلمة المرور',
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: Color(0XFFC9CECF),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'هل نسيت كلمة المرور؟',
            style: AppTextStyle.semiBold13
                .copyWith(color: AppColor.lightPrimaryColor),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
