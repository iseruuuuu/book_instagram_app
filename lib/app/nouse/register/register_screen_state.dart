// // Dart imports:
// import 'dart:io';
//
// // Flutter imports:
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:state_notifier/state_notifier.dart';
//
// // Project imports:
// import 'package:book_instagram_app/repository/model/model.dart';
// import 'package:book_instagram_app/repository/database/db_bloc.dart';
//
// part 'register_screen_state.freezed.dart';
//
// @freezed
// class RegisterScreenState with _$RegisterScreenState {
//   const factory RegisterScreenState({
//     @Default('') String imagePath,
//   }) = _RegisterScreenState;
// }
//
// class RegisterScreenController extends StateNotifier<RegisterScreenState> with LocatorMixin {
//   final BuildContext context;
//   File? image;
//   final picker = ImagePicker();
//   final TodoBloc todoBloc;
//   final Todo todo;
//   final Todo _newTodo = Todo.newTodo();
//
//   RegisterScreenController({
//     required this.context,
//     required this.todoBloc,
//     required this.todo,
//   }) : super(const RegisterScreenState()) {
//     _newTodo.id = todo.id;
//     _newTodo.contents = todo.contents;
//     _newTodo.imagePath = todo.imagePath;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   void setContents(String contents) {
//     _newTodo.contents = contents;
//     todo.contents = contents;
//     print(contents);
//   }
//
//   void onTapPost() {
//     if (_newTodo.id == null) {
//       todoBloc.create(_newTodo);
//     } else {
//       //todoBloc.update(_newTodo);
//       print(todo.id);
//       print(todo.imagePath);
//       print(todo.contents);
//     }
//
//   }
//
//
//   Future getImage() async {
//     //カメラロールから読み取る
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       var imagePath = pickedFile.path.toString();
//       todo.imagePath = imagePath;
//       state = state.copyWith(
//         imagePath: imagePath,
//       );
//     } else {
//       print('画像が選択できませんでした');
//     }
//
//
//   }
//
//   Future getCamera() async {
//     //カメラを開く
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       var imagePath = pickedFile.path.toString();
//       state = state.copyWith(
//         imagePath: imagePath,
//       );
//     } else {
//       print('カメラで画像が取得できませんでした');
//     }
//   }
// }
