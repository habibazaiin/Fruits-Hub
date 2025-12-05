import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_enitiy.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/navigation_bar_icon.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25.0,
              offset: Offset(0, -2),
              spreadRadius: 0.0,
            ),
          ]),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((entry) {
          int idx = entry.key;
          BottomNavigationBarEnitiy item = entry.value;
          bool isActive = idx == selectedIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isActive
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width * 0.2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = idx;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                child: NavigationBarIcon(
                  key: ValueKey(isActive),
                  isActive: isActive,
                  bottomNavigationBarEnitiy: item,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
