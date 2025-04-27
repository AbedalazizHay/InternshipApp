import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/pages/onboarding.dart';
import 'package:xpertbot/pages/test.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome(context);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          final size = MediaQuery.of(context).size;
          final isWeb = size.width >= 600;
          // Adjust sizes based on screen width
          double logoSize = screenWidth < 600 ? 150 : 300;
          double fontSize = screenWidth < 600 ? 24 : 40;
          double spacing = screenWidth < 600 ? 20 : 40;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo here
                SizedBox(
                  child: Image.asset(
                    'assets/images/logo.png', 
                    width: isWeb ? 250 : size.width * 0.6, // Adjust width
                    fit: BoxFit.contain, // Keep the logo's aspect ratio
                  ),
                ),
                SizedBox(height: isWeb ? 40 : 20),
                SizedBox(height: spacing),
                SlidingText(
                  slidingAnimation: slidingAnimation,
                  fontSize: fontSize,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.5),
    ).animate(animationController);
  }

  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CarouselScreen()),
        );
      }
    });
  }
}

class SlidingText extends StatelessWidget {
  final Animation<Offset> slidingAnimation;
  final double fontSize;

  const SlidingText(
      {super.key, required this.slidingAnimation, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: Center(
              // Optionally, you can add text here if needed
              // child: Text(
              //   "Welcome to WorkScout",
              //   style: GoogleFonts.quicksand(
              //     fontSize: fontSize,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              ),
        );
      },
    );
  }
}
