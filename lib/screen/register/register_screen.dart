import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'children/register_app_bar.dart';
import 'children/register_photo_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    //カメラロールから読み取る
    //final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        //ダイアログを出す？？
        print('画像が選択できませんでした。');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: image == null
                //適当な写真を載せる？？
                ? const Text('画像が選択されていません')
                : Image.file(image!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PhotoWidget(
                text: '写真を撮る',
                onTap: getImage,
              ),
              PhotoWidget(
                text: '写真を選択する',
                onTap: getImage,
              ),
            ],
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
}
