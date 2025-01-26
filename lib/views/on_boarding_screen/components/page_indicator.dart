import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;

  const PageIndicator({
    required this.currentIndex,
    required this.totalCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
