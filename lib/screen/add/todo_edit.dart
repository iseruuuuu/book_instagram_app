// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:book_instagram_app/component/register/register_no_image.dart';
import 'package:book_instagram_app/component/register/register_photo_button.dart';
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';

import 'children2/todo_photo_widget.dart';

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
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            size: 40,
            color: Colors.black,
          ),
        ),
        actions: [
          _confirmButton(context),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            _photoWidget(context),
            // TodoPhotoWidget2(
            //   image: _newTodo.title!,
            // ),
            const SizedBox(height: 20),
            _noteTextFormField(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _text(),
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
          '??????',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
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

  Widget _text() => Container(
        child: Text(
          //todo.note!,
          _newTodo.note!,
        ),
      );

  Widget _photoWidget(BuildContext context) => Center(
        child: todo.note == ''
            ? GestureDetector(onTap: getImage, child: const NoImageWidget())
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
        decoration: const InputDecoration(labelText: "Memo"),
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
        text: ' ???????????????',
        onTap: getCamera,
      );

  Future getCamera() async {
    //??????????????????
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
      _newTodo.title = imagePath;
    } else {
      print('???????????????????????????????????????????????????');
    }
  }

  Widget _cameraButton(BuildContext context) => PhotoWidget(
        icon: Icons.photo_size_select_actual_outlined,
        text: ' ???????????????',
        onTap: getImage,
      );

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
      _newTodo.title = imagePath;
    } else {
      print('???????????????????????????????????????');
    }
  }
}
