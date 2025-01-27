import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String doctorName;
  final DateTime date;
  final String time;

  const ConfirmationDialog({
    super.key,
    required this.doctorName,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 80, color: Colors.teal),
          const SizedBox(height: 16),
          const Text(
            "Congratulations!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Your appointment with $doctorName\nis confirmed for ${date.toLocal().toString().split(' ')[0]}, at $time.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
            },
            child: const Text("Done", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
