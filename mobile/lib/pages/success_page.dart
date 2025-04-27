import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:xpertbot/widgets/button.dart';

class SuccessPage extends StatelessWidget {
  final String userName;
  final String email;

  const SuccessPage({super.key, required this.userName, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Lottie.asset('assets/animations/veri.json'),
            ),
            const SizedBox(height: 20),
            Text(
              "HI, $userName!",
              style: GoogleFonts.quicksand(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Text(
                "Your account ($email) has been created successfully!",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "you need to Signin again and verify your email!",
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                  fontSize: 16, color: const Color.fromARGB(255, 211, 60, 60)),
            ),
            const SizedBox(height: 15),
            // MaterialButton(
            //   onPressed: () {},
            //   height: 50,
            //   color: Color.fromARGB(255, 70,107,139),
            //   minWidth: 200,
            //   child: Text(
            //     "continue",
            //     style: GoogleFonts.quicksand(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
            CusButton(
              title: "Continue",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("application");
              },
            ),
          ],
        ),
      ),
    );
  }
}
