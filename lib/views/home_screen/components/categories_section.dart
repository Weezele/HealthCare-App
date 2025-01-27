import 'package:flutter/material.dart';
import 'package:health_app/views/all_doctors/all_doctors.dart';

class CategoriesSection extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"icon": "🦷", "label": "Dentistry"},
    {"icon": "❤️", "label": "Cardiology"},
    {"icon": "🫁", "label": "Pulmonology"},
    {"icon": "💊", "label": "General"},
    {"icon": "🧠", "label": "Neurology"},
    {"icon": "🍽", "label": "Gastro"},
    {"icon": "🧪", "label": "Laboratory"},
    {"icon": "💉", "label": "Vaccination"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to All Doctors page without filter
                  Navigator.pushNamed(context, '/allDoctors');
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // GridView for Categories
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            shrinkWrap: true, // Makes GridView adapt to the content size
            physics:
                NeverScrollableScrollPhysics(), // Prevent GridView scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Display four categories in each row
              crossAxisSpacing: 12, // Space between columns
              mainAxisSpacing: 12, // Space between rows
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to All Doctors page with the selected category
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllDoctorsPage(),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Circular Category Card
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.teal.shade400, Colors.teal.shade200],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          categories[index]["icon"]!,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Category Label
                    Flexible(
                      child: Text(
                        categories[index]["label"]!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2, // Allow text wrapping for longer labels
                        overflow:
                            TextOverflow.ellipsis, // Handle overflow gracefully
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
