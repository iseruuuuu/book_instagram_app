// Package imports:
import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  //登録した日
  firstDay,
  //何日経過したかを記録する。
  pastDays,
  //初回起動かどうか
  isFirstBuilding,
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<int> getInt(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getInt(EnumToString.convertToString(key)) ?? 0;
    return value;
  }

  Future<void> setInt(PreferenceKey key, int value) async {
    final pref = await preference;
    await pref.setInt(EnumToString.convertToString(key), value);
  }

  Future<bool> getBool(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getBool(EnumToString.convertToString(key)) ?? false;
    return value;
  }

  Future<void> setBool(PreferenceKey key, bool value) async {
    final pref = await preference;
    await pref.setBool(EnumToString.convertToString(key), value);
  }

  Future<String> getString(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getString(EnumToString.convertToString(key)) ?? '';
    return value;
  }

  Future<void> setString(PreferenceKey key, String value) async {
    final pref = await preference;
    await pref.setString(EnumToString.convertToString(key), value);
  }
}
