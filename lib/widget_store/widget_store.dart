import 'package:flutter/material.dart';

class AppbarSlideWidget extends StatelessWidget {
  const AppbarSlideWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: stories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const SizedBox(width: 10.0);
          }
          return Container(
            margin: const EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: const CircleAvatar(
              child: Icon(
                Icons.accessibility,
              ),
            ),
          );
        },
      ),
    );
  }
}