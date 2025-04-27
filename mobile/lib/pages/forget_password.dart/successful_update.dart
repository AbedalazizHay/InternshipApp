import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/widgets/success_checkmark.dart'; // Import the SuccessCheckmark widget
import 'package:xpertbot/pages/login.dart'; // Import the Login page for navigation

class SuccessfulUpdatePage extends StatelessWidget {
  const SuccessfulUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Success Checkmark Widget
              const SuccessCheckmark(size: 150), // You can adjust the size

              const SizedBox(height: 20),

              // Success Message
              Text(
                "You've successfully updated your password!",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 70, 107, 139),
                ),
              ),
              const SizedBox(height: 20),

              // Continue Button to Login
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                color: const Color.fromARGB(255, 1, 38, 72), // Dark Blue
                minWidth: double.infinity,
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Continue to Login",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
