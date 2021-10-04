// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

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

  @override
  void initState() {
    super.initState();
  }
}
