// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:book_instagram_app/component/register/register_no_image.dart';

class TodoPhotoWidget extends StatelessWidget {
  const TodoPhotoWidget({
    Key? key,
    required this.isPhoto,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final bool isPhoto;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      //child: todo.note == ''
      child: isPhoto
          ? GestureDetector(onTap: onTap, child: const NoImageWidget())
          : SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.width / 1.6,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      //File(_newTodo.title!),
                      File(image),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
