import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.keyboardType,
      this.onSaved,
      this.validator, this.obscureText = false});
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color(0XFFF9FAFA),
          hintText: hintText,
          hintStyle:
              AppTextStyle.bold13.copyWith(color: const Color(0XFF949D9E))),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFE6E9E9)),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
