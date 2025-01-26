import 'package:flutter/material.dart';

Widget buildPurpleLogoContainer(double screenWidth, double screenHeight) {
    return Container(
      width: (screenWidth / 3) - 4, // Central container width
      height: (screenHeight / 2) - 4, // Central container height
      color: const Color.fromARGB(255, 65, 31, 71), // Purple background
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo/Logo.png', // Logo image path
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
            ),
            SizedBox(height: screenHeight * 0.01), // Small space below logo
            Text(
              'HealthPal by Wesam',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }