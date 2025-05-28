import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/widgets/button.dart'; // Assuming you have a custom button widget
import 'package:xpertbot/widgets/header.dart'; 
import 'package:xpertbot/pages/forget_password.dart/successful_update.dart'; // Importing the success page

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureTextNewPassword = true;
  bool _obscureTextConfirmPassword = true;

  // Toggle visibility for password fields
  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureTextNewPassword = !_obscureTextNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header at the top
          const Header(
            title: "Reset Your Password",
          ),
          const SizedBox(height: 40),

          // Main content for entering the new password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Main Title
                Text(
                  "Enter your new password",
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 107, 139),
                  ),
                ),
                const SizedBox(height: 20),

                // New Password Field
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // New Password
                      TextFormField(
                        controller: _newPasswordController,
                        obscureText: _obscureTextNewPassword,
                        decoration: InputDecoration(
                          labelText: "New Password",
                          hintText: "Enter new password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextNewPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: _toggleNewPasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (val.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureTextConfirmPassword,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Confirm your password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: _toggleConfirmPasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (val != _newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Reset Password Button
                CusButton(
                  title: 'Reset Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Here, you can proceed with the logic after validation is successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Password reset successful.")),
                      );

                      // Navigate to the success page after successful password reset
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SuccessfulUpdatePage()),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
