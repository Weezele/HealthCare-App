import 'package:flutter/material.dart';
import 'package:health_app/views/on_boarding_screen/onboarding_page.dart';
import 'package:health_app/views/splash_screen/components/buildDoctorContainer/build_doctor_container.dart';
import 'package:health_app/views/splash_screen/components/buildPurpleLogoContainer/buildPurple_logo_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next page after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OnboardingPage()), // Replace with your desired page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the entire layout
        children: [
          // First row of doctor images
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center row horizontally
            children: [
              buildDoctorContainer('assets/images/doctors/doctor_1.png',
                  screenWidth, screenHeight),
              const SizedBox(width: 4), // Space between containers
              buildDoctorContainer('assets/images/doctors/doctor_2.png',
                  screenWidth, screenHeight),
              const SizedBox(width: 4), // Space between containers
              buildDoctorContainer('assets/images/doctors/doctor_3.png',
                  screenWidth, screenHeight),
            ],
          ),
          const SizedBox(height: 4), // Space between rows
          // Second row with doctors and purple container
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center row horizontally
            children: [
              buildDoctorContainer('assets/images/doctors/doctor_4.png',
                  screenWidth, screenHeight),
              const SizedBox(width: 4), // Space between containers
              buildPurpleLogoContainer(screenWidth, screenHeight),
              const SizedBox(width: 4), // Space between containers
              buildDoctorContainer('assets/images/doctors/doctor_5.png',
                  screenWidth, screenHeight),
            ],
          ),
        ],
      ),
    );
  }
}
