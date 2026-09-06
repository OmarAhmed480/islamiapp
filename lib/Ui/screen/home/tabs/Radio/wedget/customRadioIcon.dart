import 'package:flutter/material.dart';

class CustomRadioIcon extends StatelessWidget {
  final bool isSelected;
  final String selectedIcon;
  final String unSelectedIcon;
  final VoidCallback onTap;

  const CustomRadioIcon({
    super.key,
    required this.isSelected,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        isSelected ? selectedIcon : unSelectedIcon,
        fit: BoxFit.fill,
      ),
    );
  }
}