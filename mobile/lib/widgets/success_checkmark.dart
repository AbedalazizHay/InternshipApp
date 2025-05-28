import 'package:flutter/material.dart';

class SuccessCheckmark extends StatelessWidget {
  final double size; // Allows flexibility for different screens

  const SuccessCheckmark({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light background
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: size * 0.5, // Adjust check size dynamically
          height: size * 0.5,
          decoration: const BoxDecoration(
            color: Color(0xFF405D72), // Dark blue check circle
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}
