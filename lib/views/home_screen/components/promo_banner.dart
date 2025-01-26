import 'package:flutter/material.dart';

class PromoBanner extends StatefulWidget {
  @override
  _PromoBannerState createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _promoData = [
    {
      "image": "assets/images/doctors/doctor_1.png",
      "title": "Looking for Specialist Doctors?",
      "description": "Schedule an appointment with our top doctors today.",
    },
    {
      "image": "assets/images/doctors/doctor_2.png",
      "title": "Access Top Medical Advice",
      "description":
          "Get connected with trusted healthcare professionals online.",
    },
    {
      "image": "assets/images/doctors/doctor_3.png",
      "title": "Book Appointments Instantly",
      "description":
          "Easily find and book specialists for your healthcare needs.",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: screenHeight * 0.25,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _promoData.length,
            itemBuilder: (context, index) {
              final promo = _promoData[index];
              return Stack(
                children: [
                  // Gradient background with rounded corners
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.teal.shade400,
                          Colors.teal.shade200,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  // Content inside the banner
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                promo["title"]!,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3,
                                      color: Colors.black38,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                promo["description"]!,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            promo["image"]!,
                            height: screenHeight * 0.18,
                            width: screenWidth * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Modern indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _promoData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: _currentIndex == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.teal : Colors.grey,
                borderRadius: BorderRadius.circular(20),
                boxShadow: _currentIndex == index
                    ? [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
