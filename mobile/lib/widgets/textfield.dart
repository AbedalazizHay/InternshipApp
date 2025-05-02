import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custextfiled extends StatefulWidget {
  final String title;
  final String hinttext;
  final String textlable;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const Custextfiled({
    super.key,
    required this.title,
    required this.hinttext,
    required this.textlable,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
    required this.validator, 
  });

  @override
  State<Custextfiled> createState() => _CustextfiledState();
}

class _CustextfiledState extends State<Custextfiled> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 38, 72),

          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.textlable,
            hintText: widget.hinttext,
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null,
            // Rounded corners
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // This makes the corners rounded
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // This applies to the enabled state
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // This applies to the focused state
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
