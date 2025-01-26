import 'package:flutter/material.dart';
import 'package:health_app/views/home_screen/home_page.dart';
import 'components/onboarding_content.dart';
import 'components/page_indicator.dart';
import 'components/onboarding_buttons.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/doctors/doctor_1.png",
      "title": "Meet Doctors Online",
      "description":
          "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations."
    },
    {
      "image": "assets/images/doctors/doctor_2.png",
      "title": "Connect with Specialists",
      "description":
          "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations."
    },
    {
      "image": "assets/images/doctors/doctor_3.png",
      "title": "Thousands of Online Specialists",
      "description":
          "Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs."
    },
  ];

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the next page (e.g., home page or login page)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void _skip() {
    // Navigate to the next page (e.g., home page or login page)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return OnboardingContent(
                  image: data["image"]!,
                  title: data["title"]!,
                  description: data["description"]!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                PageIndicator(
                  currentIndex: _currentIndex,
                  totalCount: _onboardingData.length,
                ),
                const SizedBox(height: 16),
                OnboardingButtons(
                  onSkip: _skip,
                  onNext: _nextPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
