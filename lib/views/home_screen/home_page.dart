import 'package:flutter/material.dart';
import 'package:health_app/views/home_screen/components/categories_section.dart';
import 'package:health_app/views/home_screen/components/medical_centers_section.dart';
import 'package:health_app/views/home_screen/components/promo_banner.dart';
import 'package:health_app/views/home_screen/components/search_bar.dart';
import 'package:health_app/views/home_screen/components/top_bar.dart';
import 'package:health_app/views/all_doctors/all_doctors.dart'; // Import AllDoctorsPage

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(),
                const SizedBox(height: 16),
                SearchBarrr(),
                const SizedBox(height: 16),
                PromoBanner(),
                const SizedBox(height: 24),
                CategoriesSection(),
                const SizedBox(height: 24),
                MedicalCentersSection(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildModernBottomNavigationBar(context),
    );
  }

  Widget _buildModernBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0, // Home is active
      onTap: (index) {
        switch (index) {
          case 0:
            // Already on Home
            break;
          case 1:
            // Navigate to Search Page (Add Search Page if needed)
            break;
          case 2:
            // Navigate to All Doctors Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllDoctorsPage()),
            );
            break;
          case 3:
            // Navigate to Records Page (Add Records Page if needed)
            break;
          case 4:
            // Navigate to Profile Page (Add Profile Page if needed)
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey[500],
      backgroundColor: Colors.white,
      elevation: 10,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      items: [
        _buildBottomNavigationItem(Icons.home, "Home", isActive: true),
        _buildBottomNavigationItem(Icons.calendar_today, "Appointments"),
        _buildBottomNavigationItem(Icons.medical_information, "Doctors"),
        _buildBottomNavigationItem(Icons.person, "Profile"),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem(
      IconData icon, String label,
      {bool isActive = false}) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isActive)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          Icon(icon, size: 24),
        ],
      ),
      label: label,
    );
  }
}
