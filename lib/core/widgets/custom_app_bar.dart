import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

AppBar customAppBar(BuildContext context, final String title) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          )),
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.bold19,
      ),
    );
  }