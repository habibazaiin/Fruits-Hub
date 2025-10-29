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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'هل نسيت كلمة المرور؟',
          style: AppTextStyle.semiBold13
              .copyWith(color: AppColor.lightPrimaryColor),
        ),
      ],
    );
  }
}


