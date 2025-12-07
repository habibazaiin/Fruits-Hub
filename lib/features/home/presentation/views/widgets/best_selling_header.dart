import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key, this.isHome = true});
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعًا',
          style: AppTextStyle.bold16,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'bestSellingView'),
          child: isHome ? Text(
            'المزيد',
            style:
                AppTextStyle.regular13.copyWith(color: const Color(0XFF949D9E)),
          ): const SizedBox(),
        )
      ],
    );
  }
}
