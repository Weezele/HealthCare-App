// Widget for doctor image containers
import 'package:flutter/widgets.dart';

Widget buildDoctorContainer(
    String imagePath, double screenWidth, double screenHeight) {
  return Container(
    width: (screenWidth / 3) -
        4, // Divide screen width into 3 parts and adjust for spacing
    height: (screenHeight / 2) -
        4, // Divide screen height into 2 parts and adjust for spacing
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5), // Optional: Add rounded corners
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Ensure the image fills the container
      ),
    ),
  );
}
