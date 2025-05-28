import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:xpertbot/pages/signup.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLoading = false;

  final List<String> animations = [
    'assets/animations/levelup.json',
    'assets/animations/build.json',
    'assets/animations/collaborate.json',
  ];

  final List<String> titles = [
    "Welcome to XpertBot Academy",
    "Learn, build, and collaborate!",
    "Share and Get Certified",
  ];

  final List<String> subtitles = [
    "Ready to level up your skills?",
    "Learn new skills, share expertise, and collaborate with tech teams.",
    "Boost your CV. Land your dream job. Start your journey today!",
  ];

  void _skipToLastPage() {
    _pageController.animateToPage(
      animations.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _onGetStarted() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1)); // Fake loading
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Signup()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLargeScreen = size.width > 800;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE8F0F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: animations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        animations[index],
                        height: isLargeScreen ? size.height * 0.5 : size.height * 0.4,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        titles[index],
                        style: GoogleFonts.poppins(
                          fontSize: isLargeScreen ? 30 : 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF012648),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        subtitles[index],
                        style: GoogleFonts.raleway(
                          fontSize: isLargeScreen ? 20 : 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            if (_currentPage < animations.length - 1)
              Positioned(
                top: size.height * 0.06,
                right: size.width * 0.06,
                child: TextButton(
                  onPressed: _skipToLastPage,
                  child: Text(
                    "Skip",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: size.height * 0.12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  animations.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 16 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            if (_currentPage == animations.length - 1)
              Positioned(
                bottom: size.height * 0.04,
                left: size.width * 0.2,
                right: size.width * 0.2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF012648),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _isLoading ? null : _onGetStarted,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
