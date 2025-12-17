import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsFeaturedProduct extends StatefulWidget {
  const IsFeaturedProduct({super.key, required this.onChanged});
  final ValueChanged<bool>? onChanged;

  @override
  State<IsFeaturedProduct> createState() => _IsFeaturedProductState();
}

class _IsFeaturedProductState extends State<IsFeaturedProduct> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              widget.onChanged?.call(isChecked);
            });
          },
          child: CustomCheckBox(isChecked: isChecked),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            'is featured product',
            style: AppTextStyle.semiBold13.copyWith(
              color: const Color(0XFF949D9E),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
