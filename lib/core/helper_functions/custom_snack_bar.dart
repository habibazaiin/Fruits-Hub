import 'package:flutter/material.dart';

// Enum for SnackBar types
enum SnackBarType {
  success,
  error,
  warning,
  info,
}

class CustomSnackBar {
  // Show custom snackbar with message
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onActionPressed,
    Color? customColor, // اضافة معامل اللون المخصص
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            _getIcon(type),
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: customColor ?? _getColor(type), // استخدام اللون المخصص او اللون الافتراضي
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
      action: actionLabel != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: Colors.white,
              onPressed: onActionPressed ?? () {},
            )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Get color based on type
  static Color _getColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return const Color(0xFF4CAF50);
      case SnackBarType.error:
        return const Color(0xFFF44336);
      case SnackBarType.warning:
        return const Color(0xFFFF9800);
      case SnackBarType.info:
        return const Color(0xFF2196F3);
    }
  }

  // Get icon based on type
  static IconData _getIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
    }
  }

  // Quick methods for different types
  static void showSuccess(BuildContext context, String message, {Color? customColor}) {
    show(context, message: message, type: SnackBarType.success, customColor: customColor);
  }

  static void showError(BuildContext context, String message, {Color? customColor}) {
    show(context, message: message, type: SnackBarType.error, customColor: customColor);
  }

  static void showWarning(BuildContext context, String message, {Color? customColor}) {
    show(context, message: message, type: SnackBarType.warning, customColor: customColor);
  }

  static void showInfo(BuildContext context, String message, {Color? customColor}) {
    show(context, message: message, type: SnackBarType.info, customColor: customColor);
  }
}

// Example usage in your E-commerce app
class ExampleUsage extends StatelessWidget {
  const ExampleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-commerce SnackBar Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                CustomSnackBar.showSuccess(
                  context,
                  'Product added to cart!',
                );
              },
              child: const Text('Add to Cart'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomSnackBar.showError(
                  context,
                  'Payment failed. Please try again.',
                );
              },
              child: const Text('Simulate Payment Error'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // استخدام لون مخصص
                CustomSnackBar.showWarning(
                  context,
                  'Only 2 items left in stock!',
                  customColor: Colors.deepOrange,
                );
              },
              child: const Text('Show Stock Warning'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // استخدام لون مخصص مع action
                CustomSnackBar.show(
                  context,
                  message: 'Item removed from cart',
                  type: SnackBarType.info,
                  customColor: Colors.purple,
                  actionLabel: 'UNDO',
                  onActionPressed: () {
                    CustomSnackBar.showSuccess(context, 'Item restored!');
                  },
                );
              },
              child: const Text('Remove with Custom Color'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // مثال آخر بلون مخصص
                CustomSnackBar.show(
                  context,
                  message: 'Order placed successfully!',
                  type: SnackBarType.success,
                  customColor: const Color(0xFF1B5E20), // لون أخضر غامق
                );
              },
              child: const Text('Custom Green'),
            ),
          ],
        ),
      ),
    );
  }
}