import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked});
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isChecked ? AppColor.primaryColor : Colors.white,
        border: Border.all(
          color: isChecked ? AppColor.primaryColor : const Color(0XFFDCDEDE),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isChecked
          ? Center(
              child: SvgPicture.asset(
                'assets/images/Check.svg',
                width: 16,
                height: 16,
              ),
            )
          : null,
    );
  }
}
