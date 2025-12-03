import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class CustomButtonFeaturedItem extends StatelessWidget {
  const CustomButtonFeaturedItem({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FittedBox(
              child: Text(
                'تسوق الان',
                style:
                    AppTextStyle.bold13.copyWith(color: AppColor.primaryColor),
              ),
            ),
          )),
    );
  }
}
