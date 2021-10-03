// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeProfileStateTearOff {
  const _$HomeProfileStateTearOff();

  _HomeProfileState call({int day = 0}) {
    return _HomeProfileState(
      day: day,
    );
  }
}

/// @nodoc
const $HomeProfileState = _$HomeProfileStateTearOff();

/// @nodoc
mixin _$HomeProfileState {
  int get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeProfileStateCopyWith<HomeProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeProfileStateCopyWith<$Res> {
  factory $HomeProfileStateCopyWith(
          HomeProfileState value, $Res Function(HomeProfileState) then) =
      _$HomeProfileStateCopyWithImpl<$Res>;
  $Res call({int day});
}

/// @nodoc
class _$HomeProfileStateCopyWithImpl<$Res>
    implements $HomeProfileStateCopyWith<$Res> {
  _$HomeProfileStateCopyWithImpl(this._value, this._then);

  final HomeProfileState _value;
  // ignore: unused_field
  final $Res Function(HomeProfileState) _then;

  @override
  $Res call({
    Object? day = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$HomeProfileStateCopyWith<$Res>
    implements $HomeProfileStateCopyWith<$Res> {
  factory _$HomeProfileStateCopyWith(
          _HomeProfileState value, $Res Function(_HomeProfileState) then) =
      __$HomeProfileStateCopyWithImpl<$Res>;
  @override
  $Res call({int day});
}

/// @nodoc
class __$HomeProfileStateCopyWithImpl<$Res>
    extends _$HomeProfileStateCopyWithImpl<$Res>
    implements _$HomeProfileStateCopyWith<$Res> {
  __$HomeProfileStateCopyWithImpl(
      _HomeProfileState _value, $Res Function(_HomeProfileState) _then)
      : super(_value, (v) => _then(v as _HomeProfileState));

  @override
  _HomeProfileState get _value => super._value as _HomeProfileState;

  @override
  $Res call({
    Object? day = freezed,
  }) {
    return _then(_HomeProfileState(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeProfileState implements _HomeProfileState {
  const _$_HomeProfileState({this.day = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int day;

  @override
  String toString() {
    return 'HomeProfileState(day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeProfileState &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(day);

  @JsonKey(ignore: true)
  @override
  _$HomeProfileStateCopyWith<_HomeProfileState> get copyWith =>
      __$HomeProfileStateCopyWithImpl<_HomeProfileState>(this, _$identity);
}

abstract class _HomeProfileState implements HomeProfileState {
  const factory _HomeProfileState({int day}) = _$_HomeProfileState;

  @override
  int get day => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeProfileStateCopyWith<_HomeProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
