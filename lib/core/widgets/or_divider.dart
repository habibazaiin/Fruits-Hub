import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(
          width: 18,
        ),
        Text('أو'),
        SizedBox(
          width: 18,
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}