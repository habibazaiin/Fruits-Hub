import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key,required this.onChanged});
  final ValueChanged<bool>? onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              widget.onChanged?.call(isChecked);
            });
          },
          child: CustomCheckBox(
            isChecked: isChecked,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: const Color(0XFF949D9E),
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: ' الشروط والأحكام الخاصة بنا',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
