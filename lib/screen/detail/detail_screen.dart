// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:book_instagram_app/component/register/register_no_image.dart';
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';

class DetailScreen extends StatelessWidget {
  final TodoBloc? todoBloc;
  final Todo todo;
  final Todo _newTodo = Todo.newTodo();
  File? image;
  final picker = ImagePicker();

  DetailScreen({
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
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _photoWidget(context),
            _titleWidget(),
          ],
        ),
      ),
    );
  }

  Widget _photoWidget(BuildContext context) => Center(
        child: todo.title == ''
            ? const NoImageWidget()
            : SizedBox(
                width: MediaQuery.of(context).size.width,
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

  Widget _titleWidget() => Center(
        child: Text(
          todo.note!,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
