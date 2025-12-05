import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/build_custom_app_bar.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/notification_icon.dart';
import 'package:fruits_hub/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'bestSellingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'الأكثر مبيعًا'),
      body: const BestSellingViewBody(),
    );
  }
}
