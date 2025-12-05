import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_enitiy.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/active_icon.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/inactive_icon.dart';

class NavigationBarIcon extends StatelessWidget {
  const NavigationBarIcon(
      {super.key,
      required this.isActive,
      required this.bottomNavigationBarEnitiy});
  final bool isActive;
  final BottomNavigationBarEnitiy bottomNavigationBarEnitiy;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveIcon(
            iconPath: bottomNavigationBarEnitiy.activeIconPath,
            label: bottomNavigationBarEnitiy.label,
          )
        : InactiveIcon(iconPath: bottomNavigationBarEnitiy.inactiveIconPath);
  }
}
