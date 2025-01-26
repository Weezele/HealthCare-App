import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingButtons({
    required this.onSkip,
    required this.onNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: const Text(
            "Skip",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 37, 35, 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: const Size(100, 40), // Button size
          ),
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
