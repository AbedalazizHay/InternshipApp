import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/widgets/header.dart';
import 'package:xpertbot/widgets/button.dart';
import 'package:xpertbot/widgets/textfield.dart';  // Assuming you have this for text fields
import 'package:xpertbot/pages/forget_password.dart/code.dart';  // The page to enter the verification code

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _sendCode(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    // Simulate API call to send the code
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Verification code sent to your email.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with dynamic title
          const Header(
            title: 'Forgot Password',
          ),
          const SizedBox(height: 30),

          // Form for entering the email address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email input field
                  Custextfiled(
                    title: 'Email',
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    hinttext: 'Enter your Email',
                    controller: _emailController,
                    textlable: "Email address",
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),

                  // Send Code button
                  CusButton(
                    title: 'Send Code',
                    onPressed: () => _sendCode(context),
                  ),
                  const SizedBox(height: 20),

                  // Resend Code link
                  GestureDetector(
                    onTap: () {
                      // Navigate to the code page where the user can enter the received code
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EnterCode()),
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
          ),
        ],
      ),
    );
  }
}
