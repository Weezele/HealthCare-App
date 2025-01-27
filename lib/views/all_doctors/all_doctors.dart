import 'package:flutter/material.dart';
import 'package:health_app/views/all_doctors/components/doctor_card.dart';
import 'package:health_app/views/doctor_details/doctor_details.dart';
import 'package:health_app/views/all_doctors/components/search_bar.dart';
import 'package:health_app/views/all_doctors/components/filter_chips.dart';

class AllDoctorsPage extends StatefulWidget {
  @override
  _AllDoctorsPageState createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  final List<Map<String, dynamic>> doctors = [
    {
      "image": "assets/images/doctors/doctor_1.png",
      "name": "Dr. David Patel",
      "specialization": "Cardiologist",
      "location": "Golden Cardiology Center, USA",
      "rating": 4.9,
      "reviews": 1872,
      "about":
          "Dr. David Patel is a renowned cardiologist with over 10 years of experience.",
      "workingHours": "Monday-Friday, 08:00 AM - 06:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_2.png",
          "name": "Emily Anderson",
          "comment":
              "Dr. Patel is an excellent cardiologist. Highly recommend!",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_2.png",
      "name": "Dr. Jessica Turner",
      "specialization": "Gynecologist",
      "location": "Women's Clinic, Seattle, USA",
      "rating": 4.8,
      "reviews": 127,
      "about":
          "Dr. Jessica Turner specializes in women's health and provides personalized care.",
      "workingHours": "Monday-Saturday, 09:00 AM - 05:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_1.png",
          "name": "Anna Wilson",
          "comment":
              "Dr. Turner is kind and knowledgeable. She made me feel very comfortable.",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_3.png",
      "name": "Dr. Michael Johnson",
      "specialization": "Orthopedic Surgeon",
      "location": "Maple Associates, NY, USA",
      "rating": 4.7,
      "reviews": 5223,
      "about":
          "Dr. Michael Johnson has been an orthopedic surgeon for over 15 years.",
      "workingHours": "Tuesday-Sunday, 07:00 AM - 03:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_2.png",
          "name": "James Miller",
          "comment":
              "Dr. Johnson's expertise in orthopedic surgery is unmatched.",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_4.png",
      "name": "Dr. Emily Walker",
      "specialization": "Pediatrician",
      "location": "Serenity Pediatrics Clinic, USA",
      "rating": 4.5,
      "reviews": 405,
      "about":
          "Dr. Emily Walker specializes in providing excellent care for children.",
      "workingHours": "Monday-Friday, 09:00 AM - 06:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_3.png",
          "name": "Sarah Connor",
          "comment":
              "Dr. Walker is amazing with kids and really understands their needs.",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_5.png",
      "name": "Dr. Olivia Smith",
      "specialization": "Dermatologist",
      "location": "Skin Solutions Clinic, Los Angeles, USA",
      "rating": 4.6,
      "reviews": 893,
      "about":
          "Dr. Olivia Smith provides cutting-edge dermatology solutions for various skin conditions.",
      "workingHours": "Monday-Thursday, 10:00 AM - 04:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_1.png",
          "name": "Lily Carter",
          "comment":
              "Dr. Smith helped me with my skin issues. Highly recommend!",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_1.png",
      "name": "Dr. Andrew Brown",
      "specialization": "Neurologist",
      "location": "Brain & Spine Center, Texas, USA",
      "rating": 4.4,
      "reviews": 761,
      "about":
          "Dr. Andrew Brown specializes in neurological disorders and brain surgeries.",
      "workingHours": "Monday-Friday, 09:00 AM - 05:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_4.png",
          "name": "Peter Parker",
          "comment":
              "Dr. Brown's expertise in neurology saved my life. Forever grateful!",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_2.png",
      "name": "Dr. Sophia Martinez",
      "specialization": "Endocrinologist",
      "location": "Hormone Health Center, Chicago, USA",
      "rating": 4.3,
      "reviews": 412,
      "about":
          "Dr. Sophia Martinez provides comprehensive care for hormonal disorders.",
      "workingHours": "Monday-Friday, 08:00 AM - 06:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_5.png",
          "name": "Rachel Green",
          "comment":
              "Dr. Martinez was very patient and addressed all my concerns.",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_3.png",
      "name": "Dr. Daniel Evans",
      "specialization": "Oncologist",
      "location": "Hope Cancer Institute, San Francisco, USA",
      "rating": 4.9,
      "reviews": 2341,
      "about":
          "Dr. Daniel Evans has helped many patients battle cancer with compassion and expertise.",
      "workingHours": "Monday-Saturday, 09:00 AM - 06:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_2.png",
          "name": "Mark Brown",
          "comment":
              "Dr. Evans is an exceptional oncologist. His care and knowledge are remarkable.",
        },
      ],
    },
    {
      "image": "assets/images/doctors/doctor_4.png",
      "name": "Dr. Laura Wilson",
      "specialization": "Pulmonologist",
      "location": "Breathe Easy Clinic, Boston, USA",
      "rating": 4.7,
      "reviews": 1892,
      "about":
          "Dr. Laura Wilson provides advanced treatment for lung-related conditions.",
      "workingHours": "Monday-Friday, 08:00 AM - 05:00 PM",
      "reviewsList": [
        {
          "image": "assets/images/doctors/doctor_1.png",
          "name": "John Doe",
          "comment":
              "Dr. Wilson's treatment greatly improved my breathing issues. Highly recommend!",
        },
      ],
    },
  ];

  String _searchQuery = "";
  String _selectedFilter = "All";

  final List<String> _filters = ["All", "General", "Cardiologist", "Dentist"];

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = doctors.where((doctor) {
      final matchesFilter = _selectedFilter == "All" ||
          doctor["specialization"] == _selectedFilter;
      final matchesSearch =
          doctor["name"].toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("All Doctors"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            SearchBarr(
              onSearch: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            const SizedBox(height: 16),
            // Filter Chips
            FilterChips(
              filters: _filters,
              selectedFilter: _selectedFilter,
              onFilterSelected: (filter) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
            ),
            const SizedBox(height: 16),
            // Doctors List
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    image: filteredDoctors[index]["image"],
                    name: filteredDoctors[index]["name"],
                    specialty: filteredDoctors[index]["specialization"],
                    location: filteredDoctors[index]["location"],
                    rating: filteredDoctors[index]["rating"],
                    reviews: filteredDoctors[index]["reviews"],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailsPage(
                            doctorData: filteredDoctors[index],
                          ),
                        ),
                      );
                    },
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
