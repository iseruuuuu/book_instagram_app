import 'package:flutter/material.dart';

class HomeNumber extends StatelessWidget {
  const HomeNumber({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
            title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
