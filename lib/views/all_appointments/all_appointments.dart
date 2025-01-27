import 'package:flutter/material.dart';
import 'package:health_app/views/all_appointments/components/booking_card.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> upcomingAppointments = [
    {
      "doctorName": "Dr. James Robinson",
      "specialty": "Orthopedic Surgery",
      "clinic": "Elite Ortho Clinic, USA",
      "dateTime": "May 22, 2023 - 10:00 AM",
      "image": "assets/images/doctors/doctor_1.png",
    },
    {
      "doctorName": "Dr. Daniel Lee",
      "specialty": "Gastroenterologist",
      "clinic": "Digestive Institute, USA",
      "dateTime": "June 14, 2023 - 15:00 PM",
      "image": "assets/images/doctors/doctor_2.png",
    },
  ];

  final List<Map<String, dynamic>> completedAppointments = [
    {
      "doctorName": "Dr. Sarah Johnson",
      "specialty": "Gynecologist",
      "clinic": "Women's Health Clinic, USA",
      "dateTime": "March 12, 2023 - 11:00 AM",
      "image": "assets/images/doctors/doctor_3.png",
    },
    {
      "doctorName": "Dr. Michael Chang",
      "specialty": "Cardiologist",
      "clinic": "HeartCare Center, USA",
      "dateTime": "March 2, 2023 - 12:00 AM",
      "image": "assets/images/doctors/doctor_4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
      ),
      body: Column(
        children: [
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabButton("Upcoming", 0),
              _buildTabButton("Completed", 1),
              _buildTabButton("Canceled", 2),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: _selectedTabIndex == index ? Colors.teal[100] : Colors.white,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _selectedTabIndex == index ? Colors.teal : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return _buildAppointmentList(upcomingAppointments, true);
    } else if (_selectedTabIndex == 1) {
      return _buildAppointmentList(completedAppointments, false);
    } else {
      return Center(
        child: Text(
          "No canceled appointments",
          style: TextStyle(color: Colors.grey[600]),
        ),
      );
    }
  }

  Widget _buildAppointmentList(
      List<Map<String, dynamic>> appointments, bool isUpcoming) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return BookingCard(
          doctorName: appointments[index]["doctorName"],
          specialty: appointments[index]["specialty"],
          clinic: appointments[index]["clinic"],
          dateTime: appointments[index]["dateTime"],
          image: appointments[index]["image"],
          isUpcoming: isUpcoming,
          onPrimaryAction: () {
            if (isUpcoming) {
              // Cancel Appointment
            } else {
              // Re-Book Appointment
            }
          },
          onSecondaryAction: () {
            if (isUpcoming) {
              // Reschedule Appointment
            } else {
              // Add Review
            }
          },
        );
      },
    );
  }
}
