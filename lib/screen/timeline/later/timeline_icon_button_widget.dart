import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 30,
                    icon: const Icon(Icons.favorite_border),
                  ),
                  const Text(
                    '2,515',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 30,
                        icon: const Icon(Icons.chat),
                      ),
                      const Text(
                        '350',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
    );
  }
}
