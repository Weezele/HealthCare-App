import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed; // Change to VoidCallback?

  const ConfirmButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // `onPressed` can now be null
      style: ElevatedButton.styleFrom(
        backgroundColor: onPressed != null
            ? Colors.black
            : Colors.grey, // Change color when disabled
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("Confirm", style: TextStyle(color: Colors.white)),
    );
  }
}
