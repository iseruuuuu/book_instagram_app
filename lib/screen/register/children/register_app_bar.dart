// Flutter imports:
import 'package:flutter/material.dart';

class RegisterAppBar extends StatelessWidget with PreferredSizeWidget {
  const RegisterAppBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: const Text(
        '新規投稿',
        style: TextStyle(color: Colors.black),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: onTap,
            child: const Text(
              '投稿',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
