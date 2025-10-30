import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomTextFormField(
                hintText: 'الاسم كامل', keyboardType: TextInputType.name),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
                hintText: 'البريد الالكترونى',
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0XFFC9CECF)),
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditionsWidget(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(onPressed: () {}, text: 'انشاء حساب جديد'),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget()
          ],
        ),
      ),
    );
  }
}
