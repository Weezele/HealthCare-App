import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String clinic;
  final String dateTime;
  final String image;
  final bool isUpcoming;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;

  const BookingCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.clinic,
    required this.dateTime,
    required this.image,
    required this.isUpcoming,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Doctor Information
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        specialty,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              clinic,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Date and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateTime,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Column(
                  children: [
                    // Secondary Action Button
                    OutlinedButton(
                      onPressed: onSecondaryAction,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        isUpcoming ? "Reschedule" : "Add Review",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Primary Action Button

                    ElevatedButton(
                      onPressed: onPrimaryAction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(90, 36),
                      ),
                      child: Text(
                        isUpcoming ? "Cancel" : "Re-Book",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
