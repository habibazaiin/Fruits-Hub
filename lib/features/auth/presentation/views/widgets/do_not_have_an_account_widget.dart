import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class DoNotHaveAnAccountWidget extends StatelessWidget {
  const DoNotHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟ ',
          style:
              AppTextStyle.semiBold16.copyWith(color: const Color(0XFF949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'signUpView');
          },
          child: Text('قم بانشاء حساب',
              style: AppTextStyle.semiBold16
                  .copyWith(color: AppColor.primaryColor)),
        ),
      ],
    );
  }
}
