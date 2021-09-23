import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
