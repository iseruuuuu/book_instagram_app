import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.person,
          size: 90,
          color: Colors.white,
        ),
      ),
    );
  }
}
