import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'children/register_app_bar.dart';
import 'children/register_no_image.dart';
import 'children/register_photo_button.dart';
import 'children/register_textfield.dart';

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
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        //ダイアログを出す？？
        print('画像が選択できませんでした');
      }
    });
  }

  Future getCamera() async {
    //カメラを開く
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('カメラで画像が取得できませんでした');
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
                ? const NoImageWidget()
                : SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.width / 1.6,
                    child: Image.file(image!),
                  ),
          ),
          const RegisterTextField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PhotoWidget(
                icon: Icons.camera_alt_outlined,
                text: ' 写真を撮る',
                onTap: getCamera,
              ),
              PhotoWidget(
                icon: Icons.photo_size_select_actual_outlined,
                text: ' 写真を選択',
                onTap: getImage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
