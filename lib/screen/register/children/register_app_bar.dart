import 'package:flutter/material.dart';

class RegisterAppBar extends StatelessWidget with PreferredSizeWidget {
  const RegisterAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.red,
      title: const Text(
        '新規投稿',
        style: TextStyle(color: Colors.black),
      ),
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              '投稿',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
