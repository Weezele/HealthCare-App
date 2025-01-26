import 'package:flutter/material.dart';
import 'components/doctor_card.dart';
import 'components/filter_chips.dart';
import 'components/search_bar.dart';

class AllDoctorsPage extends StatefulWidget {
  @override
  _AllDoctorsPageState createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  final List<Map<String, dynamic>> doctors = [
    {
      "image": "assets/images/doctors/doctor_1.png",
      "name": "Dr. David Patel",
      "specialty": "Cardiologist",
      "location": "Cardiology Center, USA",
      "rating": 5.0,
      "reviews": 1872
    },
    {
      "image": "assets/images/doctors/doctor_2.png",
      "name": "Dr. Jessica Turner",
      "specialty": "Gynecologist",
      "location": "Women's Clinic, Seattle, USA",
      "rating": 4.9,
      "reviews": 127
    },
    {
      "image": "assets/images/doctors/doctor_3.png",
      "name": "Dr. Michael Johnson",
      "specialty": "Orthopedic Surgery",
      "location": "Maple Associates, NY, USA",
      "rating": 4.7,
      "reviews": 5223
    },
    {
      "image": "assets/images/doctors/doctor_4.png",
      "name": "Dr. Jhon Walker",
      "specialty": "Pediatrics",
      "location": "Serenity Pediatrics Clinic",
      "rating": 5.0,
      "reviews": 405
    },
  ];

  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Doctors"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBarr(
              onSearch: (query) {
                // Implement search logic
              },
            ),
            const SizedBox(height: 16),
            FilterChips(
              filters: ["All", "General", "Cardiologist", "Dentist"],
              selectedFilter: selectedFilter,
              onFilterSelected: (filter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    image: doctors[index]["image"],
                    name: doctors[index]["name"],
                    specialty: doctors[index]["specialty"],
                    location: doctors[index]["location"],
                    rating: doctors[index]["rating"],
                    reviews: doctors[index]["reviews"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
