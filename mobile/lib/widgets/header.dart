import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title; // Dynamic title
  final IconData? rightIcon; // Optional right icon
  final VoidCallback? onRightIconPressed; // Action for right icon

  const Header({
    super.key,
    required this.title,
    this.rightIcon, // Defaults to null (not shown if not provided)
    this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.white, width: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔙 Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF405D72)),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),

          // 📌 Dynamic Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          // 🔘 Optional Right Button (Shown only if provided)
          rightIcon != null
              ? IconButton(
                  icon: Icon(rightIcon, color: const Color(0xFF405D72)),
                  onPressed: onRightIconPressed,
                )
              : const SizedBox(width: 40), // Keeps alignment when no icon
        ],
      ),
    );
  }
}
