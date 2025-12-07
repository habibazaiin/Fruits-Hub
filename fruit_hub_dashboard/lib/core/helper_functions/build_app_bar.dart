import 'package:flutter/material.dart';

AppBar buildAppbar({required BuildContext context, required String title}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }