import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.imagePath, required this.title});
  final String imagePath, title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          side: const BorderSide(color: Color(0XFFDCDEDE), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(imagePath),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold16,
          ),
        ),
      ),
    );
  }
}
