// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_photo_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoPhotoWidgetStateTearOff {
  const _$TodoPhotoWidgetStateTearOff();

  _TodoPhotoWidgetState call({int day = 0}) {
    return _TodoPhotoWidgetState(
      day: day,
    );
  }
}

/// @nodoc
const $TodoPhotoWidgetState = _$TodoPhotoWidgetStateTearOff();

/// @nodoc
mixin _$TodoPhotoWidgetState {
  int get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoPhotoWidgetStateCopyWith<TodoPhotoWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoPhotoWidgetStateCopyWith<$Res> {
  factory $TodoPhotoWidgetStateCopyWith(TodoPhotoWidgetState value,
          $Res Function(TodoPhotoWidgetState) then) =
      _$TodoPhotoWidgetStateCopyWithImpl<$Res>;
  $Res call({int day});
}

/// @nodoc
class _$TodoPhotoWidgetStateCopyWithImpl<$Res>
    implements $TodoPhotoWidgetStateCopyWith<$Res> {
  _$TodoPhotoWidgetStateCopyWithImpl(this._value, this._then);

  final TodoPhotoWidgetState _value;
  // ignore: unused_field
  final $Res Function(TodoPhotoWidgetState) _then;

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
abstract class _$TodoPhotoWidgetStateCopyWith<$Res>
    implements $TodoPhotoWidgetStateCopyWith<$Res> {
  factory _$TodoPhotoWidgetStateCopyWith(_TodoPhotoWidgetState value,
          $Res Function(_TodoPhotoWidgetState) then) =
      __$TodoPhotoWidgetStateCopyWithImpl<$Res>;
  @override
  $Res call({int day});
}

/// @nodoc
class __$TodoPhotoWidgetStateCopyWithImpl<$Res>
    extends _$TodoPhotoWidgetStateCopyWithImpl<$Res>
    implements _$TodoPhotoWidgetStateCopyWith<$Res> {
  __$TodoPhotoWidgetStateCopyWithImpl(
      _TodoPhotoWidgetState _value, $Res Function(_TodoPhotoWidgetState) _then)
      : super(_value, (v) => _then(v as _TodoPhotoWidgetState));

  @override
  _TodoPhotoWidgetState get _value => super._value as _TodoPhotoWidgetState;

  @override
  $Res call({
    Object? day = freezed,
  }) {
    return _then(_TodoPhotoWidgetState(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TodoPhotoWidgetState implements _TodoPhotoWidgetState {
  const _$_TodoPhotoWidgetState({this.day = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int day;

  @override
  String toString() {
    return 'TodoPhotoWidgetState(day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoPhotoWidgetState &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(day);

  @JsonKey(ignore: true)
  @override
  _$TodoPhotoWidgetStateCopyWith<_TodoPhotoWidgetState> get copyWith =>
      __$TodoPhotoWidgetStateCopyWithImpl<_TodoPhotoWidgetState>(
          this, _$identity);
}

abstract class _TodoPhotoWidgetState implements TodoPhotoWidgetState {
  const factory _TodoPhotoWidgetState({int day}) = _$_TodoPhotoWidgetState;

  @override
  int get day => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoPhotoWidgetStateCopyWith<_TodoPhotoWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}
