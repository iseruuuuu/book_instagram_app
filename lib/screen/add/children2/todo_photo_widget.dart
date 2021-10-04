// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:book_instagram_app/component/register/register_no_image.dart';

class TodoPhotoWidget2 extends StatefulWidget {
  const TodoPhotoWidget2({
    Key? key,
    // this.isPhoto,
    // this.image,
    // this.onTap,

    //required this.isPhoto,
    required this.image,
    // required this.onTap,
  }) : super(key: key);

  //final bool isPhoto;
  final String image;
  // final Function() onTap;

  @override
  _TodoPhotoWidgetState createState() => _TodoPhotoWidgetState();
}

class _TodoPhotoWidgetState extends State<TodoPhotoWidget2> {
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        //image = File(pickedFile.path);
        var imagePath = pickedFile.path.toString();
        //_newTodo.title = imagePath;
        widget.image == imagePath;
      } else {
        print('画像が選択できませんでした');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //child: todo.note == ''
      //child: widget.isPhoto
     child: widget.image == ''
          // ? GestureDetector(onTap: widget.onTap, child: const NoImageWidget())
          ? GestureDetector(onTap: getImage, child: const NoImageWidget())
          : SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.width / 1.6,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      //File(_newTodo.title!),
                      File(widget.image),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
