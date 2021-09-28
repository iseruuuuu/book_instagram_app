/*
// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:book_instagram_app/repository/model.dart';
import 'package:book_instagram_app/repository/model/db_bloc.dart';
import 'package:book_instagram_app/screen/register/children/register_app_bar.dart';
import 'package:book_instagram_app/screen/register/children/register_no_image.dart';
import 'package:book_instagram_app/screen/register/children/register_photo_button.dart';
import 'package:book_instagram_app/screen/register/children/register_textfield.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenStatee createState() => _RegisterScreenStatee();
}

class _RegisterScreenStatee extends State<RegisterScreen> {
  File? image;
  final picker = ImagePicker();

  // final DBBloc? todoBloc;
  // final Todo? todo;
  final Todo? _newTodo = Todo.newTodo();

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
      appBar: RegisterAppBar(
        onTap: () {
          //タブをホーム画面に移動させる。

          //データを追加する。
          // if (_newTodo!.id == null) {
          //   DBBloc?.create(_newTodo);
          // } else {
          //   todoBloc?.update(_newTodo);
          // }
        },
      ),
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

 */
