// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_picker/image_picker.dart';

part 'register_screen_state.freezed.dart';

@freezed
class RegisterScreenState with _$RegisterScreenState {
  const factory RegisterScreenState({
    //@Default('') File imagePath,
    @Default('') String imagePath,
  }) = _RegisterScreenState;
}

class RegisterScreenController extends StateNotifier<RegisterScreenState>
    with LocatorMixin {
  RegisterScreenController({
    required this.context,
  }) : super(RegisterScreenState());

  final BuildContext context;
  File? image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getImage() async {
    //カメラロールから読み取る
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // state = state.copyWith(
    //   imagePath: pickedFile.path;
    // );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
      state = state.copyWith(
        imagePath: imagePath,
      );
    } else {
      //ダイアログを出す？？
      print('画像が選択できませんでした');
    }
  }

  Future getCamera() async {
    //カメラを開く
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      var imagePath = pickedFile.path.toString();
      state = state.copyWith(
        imagePath: imagePath,
      );
    } else {
      print('カメラで画像が取得できませんでした');
    }
  }
}
