import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/widgets/button.dart';
import 'package:xpertbot/widgets/textfield.dart';
import 'signup.dart';
import 'package:xpertbot/pages/forget_password.dart/email.dart'; // Import the ForgotPasswordPage
import 'package:xpertbot/pages/tracks.dart'; // Import the TracksPage after login
import 'package:xpertbot/Controllers/LoginController.dart';
import 'package:xpertbot/Routs/AppRout.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final LoginController controller = Get.put(LoginController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    // TODO: Implement login API call
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login API will be implemented here.")),
    );

    // Navigate to the TracksPage after successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TracksPage()), // Navigate to TracksPage
    );
  }

  Future<void> _loginWithGoogle() async {
    // TODO: Implement Google login API call
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Google Sign-In will be implemented here.")),
    );
  }

  Future<void> _forgotPassword() async {
    // Navigate to ForgotPasswordPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()), // Navigate to Forgot Password page
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWeb = size.width >= 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = isWeb ? 400.0 : size.width * 0.8;

          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isWeb ? 600 : size.width),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo2.png',
                        width: isWeb ? 250 : size.width * 0.6,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: isWeb ? 40 : 10),

                      Text(
                        'Welcome back!',
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 70, 107, 139),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: maxWidth,
                        child: Custextfiled(
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

                          
                          textlable: "Email address",
                          prefixIcon: FontAwesomeIcons.envelope,
                          controller:controller.email,
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: maxWidth,
                        child: Custextfiled(
                          title: 'Password',
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (val.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          hinttext: 'Enter your Password',
                          controller: controller.password,
                          textlable: "Password",
                          prefixIcon: FontAwesomeIcons.lock,
                          obscureText: true,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: isWeb ? 400 : size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: _forgotPassword, // Call _forgotPassword to navigate
                                child: Text(
                                  'Forgot your Password?',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    color: const Color.fromARGB(255, 70, 107, 139),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: maxWidth,
                        height: 55,
                        child: CusButton(
                          title: 'Login',
                          onPressed: _login,
                          // (){
                          //   controller.login();
                          // }
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[300], thickness: 2)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Or login with",
                              style: GoogleFonts.quicksand(fontSize: 14),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey[300], thickness: 2)),
                        ],
                      ),

                      const SizedBox(height: 30),

                      InkWell(
                        onTap: _loginWithGoogle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/googleicon.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Login with Google",
                              style: GoogleFonts.quicksand(fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),

                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const Signup()),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.quicksand(fontSize: isWeb ? 16 : 14),
                              ),
                              TextSpan(
                                text: "Register",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 70, 107, 139),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
