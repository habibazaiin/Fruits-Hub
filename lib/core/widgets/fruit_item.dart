import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 359 + 24,
        decoration: ShapeDecoration(
            color: const Color(0XFFF3F5F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            )),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ),
            Positioned.fill(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  Assets.assetsImagesPageViewImage2,
                ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: const Text(
                    'تفاح',
                    style: AppTextStyle.semiBold13,
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        '20جنية /',
                        style: AppTextStyle.bold13
                            .copyWith(color: AppColor.secondaryColor),
                      ),
                      Text(
                        'الكيلو',
                        style: AppTextStyle.semiBold13
                            .copyWith(color: AppColor.lightSecondaryColor),
                      ),
                    ],
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
