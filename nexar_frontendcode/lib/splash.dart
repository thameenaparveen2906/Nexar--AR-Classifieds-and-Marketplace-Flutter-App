import 'package:ecommerce/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to OnboardingScreen after 3 seconds
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Green background color
      body: Center(
        child: Text(
          'NEXAR.',
          style: TextStyle(
            fontSize: 24, // Adjust based on Figma font size
            fontWeight: FontWeight.w600, // Semi-bold
            color: Color(0xFFFFD034),
            // Beige text color
          ),
        ),
      ),
    );
  }
}
