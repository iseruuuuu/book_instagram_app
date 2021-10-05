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

class TodoAddScreen extends StatefulWidget {
  final TodoBloc? todoBloc;
  final Todo todo;
  final Todo _newTodo = Todo.newTodo();
  File? image;
  final picker = ImagePicker();

  TodoAddScreen({
    Key? key,
    this.todoBloc,
    required this.todo,
  }) : super(key: key) {
    _newTodo.id = todo.id;
    _newTodo.title = todo.title;
    _newTodo.note = todo.note;
  }

  @override
  _TodoAddScreenState createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
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
          '投稿',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          if (widget._newTodo.id == null) {
            widget.todoBloc?.create(widget._newTodo);
          } else {
            widget.todoBloc?.update(widget._newTodo);
          }
          Navigator.of(context).pop();
        },
      );

  Widget _text() => Container(
        child: Text(
          //todo.note!,
          widget._newTodo.note!,
        ),
      );

  // Widget _photoWidget(BuildContext context) => Center(
  //       child: widget.todo.title == ''
  //           ? GestureDetector(onTap: getImage, child: const NoImageWidget())
  //           : SizedBox(
  //               width: MediaQuery.of(context).size.width / 1.1,
  //               height: MediaQuery.of(context).size.width / 1.6,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: FileImage(
  //                       File(widget._newTodo.title!),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //     );

  Widget _photoWidget(BuildContext context) => GestureDetector(
        onTap: getImage,
        child: Container(
          color: Colors.black45,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.width / 1.6,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(widget._newTodo.title!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _noteTextFormField() => TextFormField(
        decoration: const InputDecoration(labelText: "Memo"),
        initialValue: widget._newTodo.note,
        maxLines: 3,
        onChanged: _setNote,
      );

  void _setNote(String note) {
    widget._newTodo.note = note;
  }

  void onRegister(BuildContext context) {
    if (widget._newTodo.id == null) {
      widget.todoBloc?.create(widget._newTodo);
    } else {
      widget.todoBloc?.update(widget._newTodo);
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
    final pickedFile =
        await widget.picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
      widget._newTodo.title = imagePath;
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
    final pickedFile =
        await widget.picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        //image = File(pickedFile.path);
        var imagePath = pickedFile.path.toString();
        widget._newTodo.title = imagePath;
        print(imagePath);
      } else {
        print('画像が選択できませんでした');
      }
    });
  }
}
