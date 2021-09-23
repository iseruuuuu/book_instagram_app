import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(bottom: 40.0),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 6,
        decoration: const InputDecoration(
          hintText: "",
          border: OutlineInputBorder(),
        ),
        autofocus: true,
        onChanged: (text) {
          // value = text;
        },
      ),
    );
  }
}
