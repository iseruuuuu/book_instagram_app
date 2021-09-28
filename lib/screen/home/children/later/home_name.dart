// Flutter imports:
import 'package:flutter/material.dart';

class HomeName extends StatelessWidget {
  const HomeName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ryutaro Iseki',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ekrarasrsrssrasrarrarsrarasarrsarai',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rsekrsarsarasrsrsrrarsarsrarrsarsrarsarsari',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
