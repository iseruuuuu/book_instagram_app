// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:book_instagram_app/repository/model/model.dart';

part 'todo_edit_less_state.freezed.dart';

@freezed
class RRegisterScreenState with _$RRegisterScreenState {
  const factory RRegisterScreenState({
    @Default('') String imagePath,
  }) = _RRegisterScreenState;
}

class RRegisterScreenController extends StateNotifier<RRegisterScreenState> with LocatorMixin {

  // final BuildContext context;
  // File? image;
  // final picker = ImagePicker();
  // final Todo todo;
  // final Todo _newTodo = Todo.newTodo();
  //
  // RRegisterScreenController({
  //   required this.context,
  //   required this.todo,
  // }) : super(const RRegisterScreenState()) {
  //   _newTodo.id = todo.id;
  //   _newTodo.title = todo.title;
  //   _newTodo.note = todo.note;
  // }

  final BuildContext context;

  RRegisterScreenController({
    required this.context,
  }) : super(const RRegisterScreenState());


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }




}