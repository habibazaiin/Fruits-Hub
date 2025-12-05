import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/notification_icon.dart';
import 'package:svg_flutter/svg.dart';

AppBar buildCustomAppBar(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          Assets.assetsImagesArrow,
          height: 44,
          width: 44,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.bold19,
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: NotificationIcon(),
        )
      ],
    );
  }