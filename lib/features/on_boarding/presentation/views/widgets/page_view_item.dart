import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backGroundImage,
      required this.subTitle,
      required this.title,
      required this.showSkip});
  final String image, backGroundImage, subTitle;
  final Widget title;
  final bool showSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(backGroundImage, fit: BoxFit.fill)),
              Positioned(
                  bottom: 0, right: 0, left: 0, child: SvgPicture.asset(image)),
              Visibility(
                  visible: showSkip,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to next screen
                          Navigator.pushReplacementNamed(context, 'auth');
                        },
                        child: Text(
                          'تخط',
                          style: AppTextStyle.regular13
                              .copyWith(color: const Color(0xFF949D9E)),
                        ),
                      )))
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold13,
          ),
        ),
      ],
    );
  }
}
