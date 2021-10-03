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
  }) : super(const HomeProfileState());

  final BuildContext context;
  final Preference preference;


  @override
  void initState() {
    super.initState();
    state = state.copyWith(
      day: 14
    );
  }

  Future<void> checkFirst() async {
    await preference.getBool(PreferenceKey.isFirstBuilding);
  }

  Future<void> check() async {
   //if(await preference.getBool(PreferenceKey.isFirstBuilding) ?? false) return;
   final check = await preference.getBool(PreferenceKey.isFirstBuilding);
   if (check == false) return;

   //記録した日を登録する。
   final now = DateTime.now();
   final nowDay = now.day;
   print(nowDay);
   await preference.setInt(PreferenceKey.firstDay, nowDay);
  }



  Future<void> reloadDay() async {
    await preference.getInt(PreferenceKey.pastDays);
  }



  Future<void> writeDay() async {

    //初日を出す。

    //初日と今日の差分を出す。


    //保存差分を保存する。
    var pastDay = 0;
    await preference.setInt(PreferenceKey.pastDays, 11);
  }
}
