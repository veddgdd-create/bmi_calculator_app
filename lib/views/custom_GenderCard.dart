import 'package:flutter/material.dart';

class CustomGenderCard extends StatelessWidget {
  const CustomGenderCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xffEB1555)
                  : const Color(0xff333244),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 80, color: Colors.white),
                const SizedBox(height: 15),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff8BBC9E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
