import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextFormField(
                hintText: 'الاسم كامل', keyboardType: TextInputType.name),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
                hintText: 'البريد الالكترونى',
                keyboardType: TextInputType.emailAddress),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0XFFC9CECF)),
            ),
            SizedBox(
              height: 16,
            ),
            TermsAndConditionsWidget()
          ],
        ),
      ),
    );
  }
}
