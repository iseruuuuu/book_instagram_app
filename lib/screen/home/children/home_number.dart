import 'package:flutter/material.dart';

class HomeNumber extends StatelessWidget {
  const HomeNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          '237',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text('Post'),
      ],
    );
  }
}
