import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/build_app_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'addProductView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context: context, title: 'Add Product'),
      body: const AddProductViewBody(),
    );
  }

  
}
