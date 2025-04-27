import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CusButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CusButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      color: Color.fromARGB(255, 1, 38, 72),
      padding: const EdgeInsets.symmetric(vertical: 15),
      minWidth: 300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
