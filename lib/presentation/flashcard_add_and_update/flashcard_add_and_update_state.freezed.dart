// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flashcard_add_and_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FlashcardAddAndUpdateStateTearOff {
  const _$FlashcardAddAndUpdateStateTearOff();

  _FlashcardAddAndUpdateState call(
      {String mode = '1', required Flashcard flashcard}) {
    return _FlashcardAddAndUpdateState(
      mode: mode,
      flashcard: flashcard,
    );
  }
}

/// @nodoc
const $FlashcardAddAndUpdateState = _$FlashcardAddAndUpdateStateTearOff();

/// @nodoc
mixin _$FlashcardAddAndUpdateState {
  String get mode => throw _privateConstructorUsedError;
  Flashcard get flashcard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardAddAndUpdateStateCopyWith<FlashcardAddAndUpdateState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardAddAndUpdateStateCopyWith<$Res> {
  factory $FlashcardAddAndUpdateStateCopyWith(FlashcardAddAndUpdateState value,
          $Res Function(FlashcardAddAndUpdateState) then) =
      _$FlashcardAddAndUpdateStateCopyWithImpl<$Res>;
  $Res call({String mode, Flashcard flashcard});
}

/// @nodoc
class _$FlashcardAddAndUpdateStateCopyWithImpl<$Res>
    implements $FlashcardAddAndUpdateStateCopyWith<$Res> {
  _$FlashcardAddAndUpdateStateCopyWithImpl(this._value, this._then);

  final FlashcardAddAndUpdateState _value;
  // ignore: unused_field
  final $Res Function(FlashcardAddAndUpdateState) _then;

  @override
  $Res call({
    Object? mode = freezed,
    Object? flashcard = freezed,
  }) {
    return _then(_value.copyWith(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      flashcard: flashcard == freezed
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard,
    ));
  }
}

/// @nodoc
abstract class _$FlashcardAddAndUpdateStateCopyWith<$Res>
    implements $FlashcardAddAndUpdateStateCopyWith<$Res> {
  factory _$FlashcardAddAndUpdateStateCopyWith(
          _FlashcardAddAndUpdateState value,
          $Res Function(_FlashcardAddAndUpdateState) then) =
      __$FlashcardAddAndUpdateStateCopyWithImpl<$Res>;
  @override
  $Res call({String mode, Flashcard flashcard});
}

/// @nodoc
class __$FlashcardAddAndUpdateStateCopyWithImpl<$Res>
    extends _$FlashcardAddAndUpdateStateCopyWithImpl<$Res>
    implements _$FlashcardAddAndUpdateStateCopyWith<$Res> {
  __$FlashcardAddAndUpdateStateCopyWithImpl(_FlashcardAddAndUpdateState _value,
      $Res Function(_FlashcardAddAndUpdateState) _then)
      : super(_value, (v) => _then(v as _FlashcardAddAndUpdateState));

  @override
  _FlashcardAddAndUpdateState get _value =>
      super._value as _FlashcardAddAndUpdateState;

  @override
  $Res call({
    Object? mode = freezed,
    Object? flashcard = freezed,
  }) {
    return _then(_FlashcardAddAndUpdateState(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      flashcard: flashcard == freezed
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FlashcardAddAndUpdateState
    with DiagnosticableTreeMixin
    implements _FlashcardAddAndUpdateState {
  _$_FlashcardAddAndUpdateState({this.mode = '1', required this.flashcard});

  @JsonKey()
  @override
  final String mode;
  @override
  final Flashcard flashcard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlashcardAddAndUpdateState(mode: $mode, flashcard: $flashcard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlashcardAddAndUpdateState'))
      ..add(DiagnosticsProperty('mode', mode))
      ..add(DiagnosticsProperty('flashcard', flashcard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlashcardAddAndUpdateState &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality().equals(other.flashcard, flashcard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mode),
      const DeepCollectionEquality().hash(flashcard));

  @JsonKey(ignore: true)
  @override
  _$FlashcardAddAndUpdateStateCopyWith<_FlashcardAddAndUpdateState>
      get copyWith => __$FlashcardAddAndUpdateStateCopyWithImpl<
          _FlashcardAddAndUpdateState>(this, _$identity);
}

abstract class _FlashcardAddAndUpdateState
    implements FlashcardAddAndUpdateState {
  factory _FlashcardAddAndUpdateState(
      {String mode,
      required Flashcard flashcard}) = _$_FlashcardAddAndUpdateState;

  @override
  String get mode;
  @override
  Flashcard get flashcard;
  @override
  @JsonKey(ignore: true)
  _$FlashcardAddAndUpdateStateCopyWith<_FlashcardAddAndUpdateState>
      get copyWith => throw _privateConstructorUsedError;
}
