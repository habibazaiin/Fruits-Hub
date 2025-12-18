import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_product.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String productName;
  late num productPrice;
  late String productCode;
  late String productDescription;
  File? productImage;
  bool isFeaturedProduct = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  productPrice = num.tryParse(value!)!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  final parsedValue = num.tryParse(value);
                  if (parsedValue == null) {
                    return 'Please enter a valid number';
                  }
                  if (parsedValue <= 0) {
                    return 'Price must be greater than zero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
                onSaved: (value) {
                  productDescription = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Wrap Row-containing widgets with SizedBox to give them width constraints
              IsFeaturedProduct(
                onChanged: (value) {
                  isFeaturedProduct = value;
                },
              ),
              const SizedBox(height: 16),
              // Same for ImageField if it contains a Row
              SizedBox(
                width: double.infinity,
                child: ImageField(
                  onImageSelected: (value) {
                    productImage = value;
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (productImage != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Proceed with adding the product using the collected data
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {
                        // Enable auto-validation to show errors
                      });
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select a product image.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
