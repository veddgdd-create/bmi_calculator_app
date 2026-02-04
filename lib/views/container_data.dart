import 'package:flutter/material.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({
    super.key,
    required this.onTap,
    required this.icon,
    this.size = 36,
    this.bgColor = const Color(0xff8B8C9E),
    this.iconColor = Colors.white,
  });

  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(
          icon,
          size: size * 0.6, // الأيقونة أصغر شوية من الحاوية
          color: iconColor,
        ),
      ),
    );
  }
}
