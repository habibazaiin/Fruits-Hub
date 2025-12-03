import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_button_featured_item.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              top: 0,
              right: width * 0.4,
              child: SvgPicture.asset(Assets.assetsImagesPageViewImage1),
            ),
            Container(
              width: width * 0.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
                image: DecorationImage(
                  image: svg.Svg(Assets.assetsImagesFeaturedItemBackGround),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 33.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'عروض العيد',
                      style:
                          AppTextStyle.regular13.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: AppTextStyle.bold19.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    CustomButtonFeaturedItem(onPressed: () {}),
                    const SizedBox(
                      height: 29,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
