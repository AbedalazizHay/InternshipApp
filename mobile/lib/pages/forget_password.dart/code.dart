import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/widgets/button.dart'; // Assuming you have a custom button widget
import 'package:xpertbot/widgets/header.dart';
import 'package:xpertbot/pages/forget_password.dart/new_password.dart'; // Importing the Header widget

class EnterCode extends StatefulWidget {
  const EnterCode({super.key});

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<EnterCode> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header at the top
          const Header(
            title: "Verification Code",
          ),
          const SizedBox(height: 40),

          // Main content for entering the 5-digit code
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Main Title
                Text(
                  "Enter the verification code",
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 107, 139),
                  ),
                ),
                const SizedBox(height: 20),

                // Form for entering the 5-digit code
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Container(
                        width: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: _controllers[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1, // Limit to one character per field
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: '-',
                            filled: true,
                            fillColor: const Color(0xFFF0F0F0),
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            // Move to the next field automatically
                            if (value.isNotEmpty && index < 4) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a digit';
                            }
                            return null;
                          },
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),

                // Verify Code Button
                CusButton(
                  title: 'Verify Code',
                  onPressed: () {
                    // Since the backend is not implemented yet, we can leave this empty for now
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Code verification logic is not implemented.")),
                    );
                    // After verification, navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPassword()), // Will be implemented later
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Resend Code Link
                GestureDetector(
                  onTap: () {
                    // You can implement a logic here to resend the code
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Code has been resent.")),
                    );
                  },
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 70, 107, 139),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
