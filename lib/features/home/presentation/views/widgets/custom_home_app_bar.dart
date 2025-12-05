import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/notification_icon.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Assets.assetsImagesProfile,
      ),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyle.regular16.copyWith(color: const Color(0XFF949D9E)),
      ),
      subtitle: Text('أحمد مصطفي',
          style: AppTextStyle.bold16.copyWith(color: const Color(0XFF0C0D0D))),
      trailing: const NotificationIcon(),
    );
  }
}


