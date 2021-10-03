// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_edit_less_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RRegisterScreenStateTearOff {
  const _$RRegisterScreenStateTearOff();

  _RRegisterScreenState call({String imagePath = ''}) {
    return _RRegisterScreenState(
      imagePath: imagePath,
    );
  }
}

/// @nodoc
const $RRegisterScreenState = _$RRegisterScreenStateTearOff();

/// @nodoc
mixin _$RRegisterScreenState {
  String get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RRegisterScreenStateCopyWith<RRegisterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RRegisterScreenStateCopyWith<$Res> {
  factory $RRegisterScreenStateCopyWith(RRegisterScreenState value,
          $Res Function(RRegisterScreenState) then) =
      _$RRegisterScreenStateCopyWithImpl<$Res>;
  $Res call({String imagePath});
}

/// @nodoc
class _$RRegisterScreenStateCopyWithImpl<$Res>
    implements $RRegisterScreenStateCopyWith<$Res> {
  _$RRegisterScreenStateCopyWithImpl(this._value, this._then);

  final RRegisterScreenState _value;
  // ignore: unused_field
  final $Res Function(RRegisterScreenState) _then;

  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RRegisterScreenStateCopyWith<$Res>
    implements $RRegisterScreenStateCopyWith<$Res> {
  factory _$RRegisterScreenStateCopyWith(_RRegisterScreenState value,
          $Res Function(_RRegisterScreenState) then) =
      __$RRegisterScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String imagePath});
}

/// @nodoc
class __$RRegisterScreenStateCopyWithImpl<$Res>
    extends _$RRegisterScreenStateCopyWithImpl<$Res>
    implements _$RRegisterScreenStateCopyWith<$Res> {
  __$RRegisterScreenStateCopyWithImpl(
      _RRegisterScreenState _value, $Res Function(_RRegisterScreenState) _then)
      : super(_value, (v) => _then(v as _RRegisterScreenState));

  @override
  _RRegisterScreenState get _value => super._value as _RRegisterScreenState;

  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(_RRegisterScreenState(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RRegisterScreenState implements _RRegisterScreenState {
  const _$_RRegisterScreenState({this.imagePath = ''});

  @JsonKey(defaultValue: '')
  @override
  final String imagePath;

  @override
  String toString() {
    return 'RRegisterScreenState(imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RRegisterScreenState &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imagePath);

  @JsonKey(ignore: true)
  @override
  _$RRegisterScreenStateCopyWith<_RRegisterScreenState> get copyWith =>
      __$RRegisterScreenStateCopyWithImpl<_RRegisterScreenState>(
          this, _$identity);
}

abstract class _RRegisterScreenState implements RRegisterScreenState {
  const factory _RRegisterScreenState({String imagePath}) =
      _$_RRegisterScreenState;

  @override
  String get imagePath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RRegisterScreenStateCopyWith<_RRegisterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
