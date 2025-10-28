import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
