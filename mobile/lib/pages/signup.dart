import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/Controllers/SignupController.dart';
import 'package:xpertbot/widgets/button.dart';
import 'package:xpertbot/widgets/textfield.dart';
import 'package:xpertbot/pages/success_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertbot/pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
 final SignupController controller = Get.put(SignupController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Saving data to SharedPreferences (for testing purposes)
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        // Save user data to SharedPreferences
        await prefs.setString('username',controller.username.text.trim());
        await prefs.setString('email', controller.email.text.trim());
        await prefs.setString('password', controller.password.text.trim());

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User registered successfully!"),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to SuccessPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SuccessPage(
              userName: controller.username.text.trim(),
              email: controller.email.text.trim(),
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWeb = size.width >= 600;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isWeb ? 600 : size.width,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// **Logo Section**
                    SizedBox(
                      child: Image.asset(
                        'assets/images/logo2.png', // Update to correct asset path
                        width: isWeb ? 250 : size.width * 0.6,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: isWeb ? 40 : 20),

                    /// **Username Field**
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: isWeb ? 400 : size.width * 0.8,
                        child: Custextfiled(
                          title: 'Username',
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          hinttext: 'Username',
                          textlable: "Username",
                          prefixIcon: FontAwesomeIcons.user,
                          controller: controller.username,
                        ),
                      ),
                    ),
                    SizedBox(height: isWeb ? 10 : 15),

                    /// **Email Field**
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: isWeb ? 400 : size.width * 0.8,
                        child: Custextfiled(
                          title: 'Email',
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return "Email cannot be empty";
                            }
                            return null;
                          },
                          hinttext: 'Email address',
                          controller: controller.email,
                          textlable: "Email address",
                          prefixIcon: FontAwesomeIcons.envelope,
                        ),
                      ),
                    ),
                    SizedBox(height: isWeb ? 10 : 20),

                    /// **Password Field**
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: isWeb ? 400 : size.width * 0.8,
                        child: Custextfiled(
                          title: 'Password',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Password cannot be empty";
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
                    ),
                    const SizedBox(height: 20),

                    /// **Signup Button**
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 55,
                        width: isWeb ? 400 : size.width * 0.8,
                        child: CusButton(
                          title: 'Signup',
                          onPressed:(){
                            controller.signup();
                          } //_signup,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     InkWell(
                    onTap: _signup,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/googleicon.png', width: 20, height: 20),
                        const SizedBox(width: 8),
                        Text(
                          "Signup with Google",
                          style: GoogleFonts.quicksand(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                                      const SizedBox(height: 8),


                    GestureDetector(
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Login()),
    );
  },
  child: Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "Already have an account? ",
          style: GoogleFonts.quicksand(fontSize: isWeb ? 16 : 14),
        ),
        TextSpan(
          text: "Login",
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
        ),
      ),
    );
  }
}
