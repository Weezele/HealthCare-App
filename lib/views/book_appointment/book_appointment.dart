import 'package:flutter/material.dart';
import 'package:health_app/views/book_appointment/components/data_selctor.dart';
import 'components/time_selector.dart';
import 'components/confirmation_dialog.dart';
import 'components/confirm_button.dart';

class BookAppointmentPage extends StatefulWidget {
  final String doctorName;

  const BookAppointmentPage({super.key, required this.doctorName});

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = "";
  final List<String> _timeSlots = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "03:00 PM",
    "03:30 PM",
    "04:00 PM",
    "04:30 PM",
  ];

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        doctorName: widget.doctorName,
        date: _selectedDate,
        time: _selectedTime,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateSelector(
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              const SizedBox(height: 24),
              TimeSelector(
                timeSlots: _timeSlots,
                selectedTime: _selectedTime,
                onTimeSelected: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),
              const SizedBox(height: 24),
              ConfirmButton(
                onPressed: _selectedTime.isNotEmpty
                    ? _showConfirmationDialog
                    : null, // Disable button if no time selected
              ),
            ],
          ),
        ),
      ),
    );
  }
}
