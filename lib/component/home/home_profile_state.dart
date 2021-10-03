// Flutter imports:
import 'package:book_instagram_app/repository/preference/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'home_profile_state.freezed.dart';

@freezed
class HomeProfileState with _$HomeProfileState {
  const factory HomeProfileState({
    @Default(0) int day,
  }) = _HomeProfileState;
}

class HomeProfileController extends StateNotifier<HomeProfileState>
    with LocatorMixin {
  HomeProfileController({
    required this.context,
    required this.preference,
  }) : super(HomeProfileState());

  final BuildContext context;
  final Preference preference;

  @override
  void initState() {
    super.initState();
    state = state.copyWith(day: 14);
    check();
    reloadDay();
  }

  Future<void> check() async {
    final check = await preference.getBool(PreferenceKey.isFirstBuilding);
    if (check == true) return;
    await preference.setBool(PreferenceKey.isFirstBuilding, true);
    //記録した日を登録する。
    final now = DateTime.now().toString();
    //await preference.setInt(PreferenceKey.firstDay, nowDay);
    await preference.setString(PreferenceKey.firstDay, now);
  }

  Future<void> reloadDay() async {
    //登録した日を読み込む
    //final registerDay = await preference.getInt(PreferenceKey.firstDay);

    final registerDay = await preference.getString(PreferenceKey.firstDay);

    final date = DateTime.parse(registerDay);

    print(date);

    //今日の日を登録
    final now = DateTime.now();
    final nowDay = now.day;

    //final i = registerDay.difference(now);

    // final pastTime = date.difference(now);

    //今日の日 - 登録した日  ＝  〇〇日め
    final pastTime = now.difference(date);

    final day = pastTime.inDays;
    state = state.copyWith(
      day: day,
    );
  }
}
