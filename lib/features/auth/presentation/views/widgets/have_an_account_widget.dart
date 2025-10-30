import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟ ',
          style:
              AppTextStyle.semiBold16.copyWith(color: const Color(0XFF949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text('تسجيل دخول',
              style: AppTextStyle.semiBold16
                  .copyWith(color: AppColor.primaryColor)),
        ),
      ],
    );
  }
}
