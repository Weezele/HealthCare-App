import 'package:flutter/material.dart';

class MedicalCentersSection extends StatelessWidget {
  final List<Map<String, String>> centers = [
    {
      "image": "assets/images/doctors/clinic_1.png", // Updated path
      "name": "Sunrise Health Clinic"
    },
    {
      "image": "assets/images/doctors/clinic_2.png", // Updated path
      "name": "Golden Cardiology"
    },
    {
      "image": "assets/images/doctors/clinic_3.png", // Updated path
      "name": "Harmony Wellness Center"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nearby Medical Centers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Horizontal List of Medical Centers
        SizedBox(
          height: 150, // Adjusted height to accommodate modern layout
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: centers.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Medical Center Image
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(centers[index]["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Medical Center Name
                  SizedBox(
                    width: 160, // Ensures text doesn't overflow
                    child: Text(
                      centers[index]["name"]!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
          ),
        ),
      ],
    );
  }
}
