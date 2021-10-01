// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:book_instagram_app/screen/register/children/register_no_image.dart';
import 'package:book_instagram_app/screen/register/children/register_photo_button.dart';

class TodoEditScreen extends StatelessWidget {
  final TodoBloc? todoBloc;
  final Todo todo;
  final Todo _newTodo = Todo.newTodo();
  File? image;
  final picker = ImagePicker();

  TodoEditScreen({
    Key? key,
    this.todoBloc,
    required this.todo,
  }) : super(key: key) {
    _newTodo.id = todo.id;
    _newTodo.title = todo.title;
    _newTodo.note = todo.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          _confirmButton(context),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _photoWidget(context),
            _noteTextFormField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _photoButton(context),
                _cameraButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmButton(BuildContext context) => TextButton(
        child: const Text(
          '登録',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if (_newTodo.id == null) {
            todoBloc?.create(_newTodo);
          } else {
            todoBloc?.update(_newTodo);
          }
          Navigator.of(context).pop();
        },
      );

  Widget _photoWidget(BuildContext context) => Center(
        child: todo.title == ''
            ? const NoImageWidget()
            : SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.width / 1.6,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                        File(_newTodo.title!),
                      ),
                    ),
                  ),
                ),
              ),
      );

  Widget _noteTextFormField() => TextFormField(
        decoration: const InputDecoration(labelText: "メモ"),
        initialValue: _newTodo.note,
        maxLines: 3,
        onChanged: _setNote,
      );

  void _setNote(String note) {
    _newTodo.note = note;
  }

  void onRegister(BuildContext context) {
    if (_newTodo.id == null) {
      todoBloc?.create(_newTodo);
    } else {
      todoBloc?.update(_newTodo);
    }
    Navigator.of(context).pop();
  }

  Widget _photoButton(BuildContext context) => PhotoWidget(
        icon: Icons.camera_alt_outlined,
        text: ' 写真を撮る',
        onTap: getCamera,
      );

  Future getCamera() async {
    //カメラを開く
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
    } else {
      print('カメラで画像が取得できませんでした');
    }
  }

  Widget _cameraButton(BuildContext context) => PhotoWidget(
        icon: Icons.photo_size_select_actual_outlined,
        text: ' 写真を選択',
        onTap: getImage,
      );

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
      _newTodo.title = imagePath;
      print(_newTodo.title);
    } else {
      print('画像が選択できませんでした');
    }
  }
}
