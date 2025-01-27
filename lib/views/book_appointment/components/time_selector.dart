import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  final List<String> timeSlots;
  final String selectedTime;
  final Function(String) onTimeSelected;

  const TimeSelector(
      {super.key,
      required this.timeSlots,
      required this.selectedTime,
      required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Hour",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: timeSlots.map((time) {
            return ChoiceChip(
              label: Text(time),
              selected: time == selectedTime,
              onSelected: (isSelected) => onTimeSelected(time),
              selectedColor: Colors.teal[100],
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: time == selectedTime ? Colors.teal : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
