import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0X0A000000),
            spreadRadius: 0,
            blurRadius: 9,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Image.asset(Assets.assetsImagesSearch),
            border: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            suffixIcon: Image.asset(Assets.assetsImagesFilter),
            filled: true,
            fillColor: Colors.white,
            hintText: 'ابحث عن.......',
            hintStyle: AppTextStyle.regular13.copyWith(
              color: const Color(0XFF949D9E),
            )),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
