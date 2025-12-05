import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.iconPath, required this.label});
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: FittedBox(
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: AppTextStyle.semiBold11
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
