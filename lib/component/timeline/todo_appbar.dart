// Flutter imports:
import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget with PreferredSizeWidget {
  const TodoAppBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text(
            ' Bookgram',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
              size: 40,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
