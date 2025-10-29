import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/do_not_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
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
            const DoNotHaveAnAccountWidget(),
            const SizedBox(
              height: 33,
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(
              height: 33,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تمتلك حساب؟ ',
                  style: AppTextStyle.semiBold16
                      .copyWith(color: const Color(0XFF949D9E)),
                ),
                Text('قم بانشاء حساب',
                    style: AppTextStyle.semiBold16
                        .copyWith(color: AppColor.primaryColor)),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            const SocialLoginButton(
              imagePath: Assets.assetsImagesGoogleIcon,
              title: 'تسجيل بواسطة جوجل',
            ),
            const SizedBox(
              height: 16,
            ),
            const SocialLoginButton(
              imagePath: Assets.assetsImagesAppleIcon,
              title: 'تسجيل بواسطة أبل',
            ),
            const SizedBox(
              height: 16,
            ),
            const SocialLoginButton(
              imagePath: Assets.assetsImagesFaceBookIcon,
              title: 'تسجيل بواسطة فيسبوك',
            ),
          ],
        ),
      ),
    );
  }
}
