import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/or_divider.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/do_not_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email;
  late String password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: 'البريد الالكترونى',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك ادخل البريد الالكترونى';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'من فضلك ادخل بريد الكترونى صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'هل نسيت كلمة المرور؟',
                    style: AppTextStyle.semiBold13
                        .copyWith(color: AppColor.lightPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignInCubit>()
                          .signIn(email: email, password: password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل دخول'),
              const SizedBox(
                height: 33,
              ),
              const DoNotHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  imagePath: Assets.assetsImagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                  onPressed: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  }),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              // SocialLoginButton(
              //   imagePath: Assets.assetsImagesFaceBookIcon,
              //   title: 'تسجيل بواسطة فيسبوك',
              //   onPressed: () {
              //     // context.read<SignInCubit>().signInWithFacebook();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
