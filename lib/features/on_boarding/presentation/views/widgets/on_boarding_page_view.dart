import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          showSkip: true,
          image: Assets.assetsImagesPageViewImage1,
          backGroundImage: Assets.assetsImagesPageViewBackfround1,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحبًا بك في ',
                style: AppTextStyle.bold23,
              ),
              Text(
                'HUB',
                style: AppTextStyle.bold23
                    .copyWith(color: AppColor.secondaryColor),
              ),
              Text(
                'Fruit',
                style:
                    AppTextStyle.bold23.copyWith(color: AppColor.primaryColor),
              ),
            ],
          ),
        ),
        const PageViewItem(
          showSkip: false,
          image: Assets.assetsImagesPageViewImage2,
          backGroundImage: Assets.assetsImagesPageViewBackground2,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابحث وتسوق',
                style: AppTextStyle.bold23,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
