import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        children :const [
          Text('写真の投稿'),
          Text('文字の投稿'),
        ]
      ),
    );
  }
}
