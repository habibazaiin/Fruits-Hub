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
      backgroundColor: _getColor(type),
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
  static void showSuccess(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.success);
  }

  static void showError(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.error);
  }

  static void showWarning(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.warning);
  }

  static void showInfo(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.info);
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
                CustomSnackBar.showWarning(
                  context,
                  'Only 2 items left in stock!',
                );
              },
              child: const Text('Show Stock Warning'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomSnackBar.show(
                  context,
                  message: 'Item removed from cart',
                  type: SnackBarType.info,
                  actionLabel: 'UNDO',
                  onActionPressed: () {
                    // Handle undo action
                    CustomSnackBar.showSuccess(context, 'Item restored!');
                  },
                );
              },
              child: const Text('Remove with Undo'),
            ),
          ],
        ),
      ),
    );
  }
}
