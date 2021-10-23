// Dart imports:
import 'dart:io';
import 'dart:typed_data';

// Flutter imports:
import 'package:book_instagram_app/component/register/register_no_image.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:book_instagram_app/component/register/register_photo_button.dart';
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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
  final imagePicker = ImagePicker();
  File? imageFile;
  var images = '';

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
      body: Column(
        children: <Widget>[
          _photoWidget(context),
          const SizedBox(height: 20),
          _noteTextFormField(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //_photoButton(context),
              //_cameraButton(context),
              PhotoWidget(
                icon: Icons.camera_alt_outlined,
                text: ' 写真を撮る',
                onTap: getCamera,
              ),
              PhotoWidget(
                icon: Icons.photo_size_select_actual_outlined,
                text: ' 写真を選択',
                onTap: () {
                  //TODO 後でやる
                },
                //onTap: getImage,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Spacer(),
        ],
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

  Widget _photoWidget(BuildContext context) => GestureDetector(
        onTap: _imgFromGallery,
        child: images == ''
            ? const NoImageWidget()
            : Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          //File(widget._newTodo.title!),
                          File(images),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      );

  Widget _noteTextFormField() => Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextFormField(
          decoration: const InputDecoration(labelText: "Memo"),
          initialValue: widget._newTodo.note,
          maxLines: 3,
          //onChanged: _setNote,
          onChanged: (note) {
            widget._newTodo.note = note;
          },
        ),
      );

  void onRegister(BuildContext context) {
    if (widget._newTodo.id == null) {
      widget.todoBloc?.create(widget._newTodo);
    } else {
      widget.todoBloc?.update(widget._newTodo);
    }
    Navigator.of(context).pop();
  }

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

  _imgFromGallery() async {
    //Galleryから画像を取得
    final PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    //NOTE これでちゃんとファイルに保存される。
    var savedFile = await saveLocalImage(pickedFile);

    var savedFile2 = await Image(pickedFile);

    //print(savedFile);
    setState(() {
      //NOTE 表示用!!
      images = pickedFile.path;

      //NOTE 追加用!!
      //widget._newTodo.title = savedFile.toString();

     //widget._newTodo.title = savedFile2;

      widget._newTodo.title = pickedFile.path;




      ///Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/14D816B2-79F6-4444-9BBB-6B3566CCE4AC/data/Containers/Data/Application/4C9DD0FB-A413-4331-867A-A4074587617F/tmp/image_picker_BE9C274C-8F1B-48C4-8F32-5E36CCC17A78-3917-0000055D4ACE2321.jpg
      //print(images);
      //File: '/Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/14D816B2-79F6-4444-9BBB-6B3566CCE4AC/data/Containers/Data/Application/4C9DD0FB-A413-4331-867A-A4074587617F/Documents/image_picker_BE9C274C-8F1B-48C4-8F32-5E36CCC17A78-3917-0000055D4ACE2321.jpg'
      //print(widget._newTodo.title);
    });
  }

  static Future saveLocalImage(PickedFile image) async {
    //ストレージパス取得
    final path = await localPath;
    //TODO /Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/7C3BDFE2-2727-4833-ABE6-B2DECAAFE400/data/Containers/Data/Application/423E7DF0-24BC-4B94-A769-9F145B07720E/Documents
    //print(path);
    //basename(image.path)で.jpgを取得。
    final String fileName = basename(image.path);
    //TODO image_picker_5314503F-DC96-49BA-B2FB-6516BA339275-12949-00000BAC9C5A4BB0.jpg
    //print(fileName);
    final imagePath = '$path/$fileName';
    //TODO /Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/7C3BDFE2-2727-4833-ABE6-B2DECAAFE400/data/Containers/Data/Application/423E7DF0-24BC-4B94-A769-9F145B07720E/Documents/image_picker_69C50F5D-5899-4748-B153-065FD689942F-12949-00000BC780BDDE12.jpg
    //print(imagePath);
    //SharePreferenceで画像のストレージパスを保存
    File imageFile = File(imagePath);
    //TODO  File: '/Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/7C3BDFE2-2727-4833-ABE6-B2DECAAFE400/data/Containers/Data/Application/423E7DF0-24BC-4B94-A769-9F145B07720E/Documents/image_picker_041D0AD5-8B43-400F-BF44-9145245819DF-12949-00000C081584695E.jpg'
    //print(imageFile);
    //選択した画像をByteDataにしてリターン
    var saveFile = await imageFile.writeAsBytes(await image.readAsBytes());
    //TODO   File: '/Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/7C3BDFE2-2727-4833-ABE6-B2DECAAFE400/data/Containers/Data/Application/423E7DF0-24BC-4B94-A769-9F145B07720E/Documents/image_picker_6F49913C-6E9F-49C4-BDF2-0E6A160055CB-12949-00000C1C8A53690A.jpg'
    //print(saveFile);
    return saveFile;
  }

  static Future Image(PickedFile image) async {
    final path = await localPath;
    final String fileName = basename(image.path);
    final imagePath = '$path/$fileName';
    return imagePath;
  }

  static Future get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
