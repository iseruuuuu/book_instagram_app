import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:book_instagram_app/screen/register/children/register_app_bar.dart';
import 'package:book_instagram_app/screen/register/children/register_photo_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TodoEditScreen extends StatelessWidget {
  final DateFormat _format = DateFormat("yyyy/MM/dd HH:mm");
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
    //初期値
    _newTodo.id = todo.id;
    _newTodo.title = todo.title;
    _newTodo.note = todo.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '追加',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _titleTextFormField(),
            _noteTextFormField(),
            _confirmButton(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PhotoButton(context),
                _CameraButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleTextFormField() => TextFormField(
        decoration: const InputDecoration(labelText: "タイトル"),
        //初期の値
        initialValue: _newTodo.title,
        //変更を常に知らせる。
        onChanged: _setTitle,
      );

  void _setTitle(String title) {
    _newTodo.title = title;
  }

  Widget _noteTextFormField() => TextFormField(
        decoration: const InputDecoration(labelText: "メモ"),
        initialValue: _newTodo.note,
        maxLines: 3,
        onChanged: _setNote,
      );

  void _setNote(String note) {
    _newTodo.note = note;
  }

  Widget _confirmButton(BuildContext context) => SizedBox(
        width: 100,
        height: 100,
        child: RaisedButton.icon(
          icon: const Icon(
            Icons.tag_faces,
            color: Colors.white,
          ),
          label: const Text('決定'),
          onPressed: () {
            //id で管理をする。
            if (_newTodo.id == null) {
              todoBloc?.create(_newTodo);
            } else {
              todoBloc?.update(_newTodo);
            }
            Navigator.of(context).pop();
          },
          shape: const StadiumBorder(),
          color: Colors.green,
          textColor: Colors.white,
        ),
      );

  void onRegister(BuildContext context) {
    if (_newTodo.id == null) {
      todoBloc?.create(_newTodo);
    } else {
      todoBloc?.update(_newTodo);
    }
    Navigator.of(context).pop();
  }

  Widget _PhotoButton(BuildContext context) => PhotoWidget(
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

  Widget _CameraButton(BuildContext context) => PhotoWidget(
        icon: Icons.photo_size_select_actual_outlined,
        text: ' 写真を選択',
        onTap: getImage,
      );

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
    } else {
      print('画像が選択できませんでした');
    }
  }
}
