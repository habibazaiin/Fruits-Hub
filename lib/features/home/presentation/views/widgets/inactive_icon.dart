import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({super.key, required this.iconPath});
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath);
  }
}