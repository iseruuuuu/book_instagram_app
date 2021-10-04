// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:book_instagram_app/repository/preference/preference.dart';

part 'todo_photo_widget_state.freezed.dart';

@freezed
class TodoPhotoWidgetState with _$TodoPhotoWidgetState {
  const factory TodoPhotoWidgetState({
    @Default(0) int day,
  }) = _TodoPhotoWidgetState;
}

class TodoPhotoWidgetController extends StateNotifier<TodoPhotoWidgetState>
    with LocatorMixin {
  TodoPhotoWidgetController({
    required this.context,
    required this.preference,
  }) : super(const TodoPhotoWidgetState());

  final BuildContext context;
  final Preference preference;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future getCamera() async {
    //カメラを開く
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      var imagePath = pickedFile.path.toString();
     // _newTodo.title = imagePath;
    } else {
      print('カメラで画像が取得できませんでした');
    }
  }
}
