// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_add_and_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WordAddAndUpdateStateTearOff {
  const _$WordAddAndUpdateStateTearOff();

  _WordAddAndUpdateState call(
      {Flashcard? parentFlashcard, Word? word, bool isUpdateMode = false}) {
    return _WordAddAndUpdateState(
      parentFlashcard: parentFlashcard,
      word: word,
      isUpdateMode: isUpdateMode,
    );
  }
}

/// @nodoc
const $WordAddAndUpdateState = _$WordAddAndUpdateStateTearOff();

/// @nodoc
mixin _$WordAddAndUpdateState {
  Flashcard? get parentFlashcard => throw _privateConstructorUsedError;
  Word? get word => throw _privateConstructorUsedError;
  bool get isUpdateMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordAddAndUpdateStateCopyWith<WordAddAndUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordAddAndUpdateStateCopyWith<$Res> {
  factory $WordAddAndUpdateStateCopyWith(WordAddAndUpdateState value,
          $Res Function(WordAddAndUpdateState) then) =
      _$WordAddAndUpdateStateCopyWithImpl<$Res>;
  $Res call({Flashcard? parentFlashcard, Word? word, bool isUpdateMode});
}

/// @nodoc
class _$WordAddAndUpdateStateCopyWithImpl<$Res>
    implements $WordAddAndUpdateStateCopyWith<$Res> {
  _$WordAddAndUpdateStateCopyWithImpl(this._value, this._then);

  final WordAddAndUpdateState _value;
  // ignore: unused_field
  final $Res Function(WordAddAndUpdateState) _then;

  @override
  $Res call({
    Object? parentFlashcard = freezed,
    Object? word = freezed,
    Object? isUpdateMode = freezed,
  }) {
    return _then(_value.copyWith(
      parentFlashcard: parentFlashcard == freezed
          ? _value.parentFlashcard
          : parentFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      isUpdateMode: isUpdateMode == freezed
          ? _value.isUpdateMode
          : isUpdateMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$WordAddAndUpdateStateCopyWith<$Res>
    implements $WordAddAndUpdateStateCopyWith<$Res> {
  factory _$WordAddAndUpdateStateCopyWith(_WordAddAndUpdateState value,
          $Res Function(_WordAddAndUpdateState) then) =
      __$WordAddAndUpdateStateCopyWithImpl<$Res>;
  @override
  $Res call({Flashcard? parentFlashcard, Word? word, bool isUpdateMode});
}

/// @nodoc
class __$WordAddAndUpdateStateCopyWithImpl<$Res>
    extends _$WordAddAndUpdateStateCopyWithImpl<$Res>
    implements _$WordAddAndUpdateStateCopyWith<$Res> {
  __$WordAddAndUpdateStateCopyWithImpl(_WordAddAndUpdateState _value,
      $Res Function(_WordAddAndUpdateState) _then)
      : super(_value, (v) => _then(v as _WordAddAndUpdateState));

  @override
  _WordAddAndUpdateState get _value => super._value as _WordAddAndUpdateState;

  @override
  $Res call({
    Object? parentFlashcard = freezed,
    Object? word = freezed,
    Object? isUpdateMode = freezed,
  }) {
    return _then(_WordAddAndUpdateState(
      parentFlashcard: parentFlashcard == freezed
          ? _value.parentFlashcard
          : parentFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      isUpdateMode: isUpdateMode == freezed
          ? _value.isUpdateMode
          : isUpdateMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WordAddAndUpdateState implements _WordAddAndUpdateState {
  _$_WordAddAndUpdateState(
      {this.parentFlashcard, this.word, this.isUpdateMode = false});

  @override
  final Flashcard? parentFlashcard;
  @override
  final Word? word;
  @JsonKey()
  @override
  final bool isUpdateMode;

  @override
  String toString() {
    return 'WordAddAndUpdateState(parentFlashcard: $parentFlashcard, word: $word, isUpdateMode: $isUpdateMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordAddAndUpdateState &&
            const DeepCollectionEquality()
                .equals(other.parentFlashcard, parentFlashcard) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.isUpdateMode, isUpdateMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(parentFlashcard),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(isUpdateMode));

  @JsonKey(ignore: true)
  @override
  _$WordAddAndUpdateStateCopyWith<_WordAddAndUpdateState> get copyWith =>
      __$WordAddAndUpdateStateCopyWithImpl<_WordAddAndUpdateState>(
          this, _$identity);
}

abstract class _WordAddAndUpdateState implements WordAddAndUpdateState {
  factory _WordAddAndUpdateState(
      {Flashcard? parentFlashcard,
      Word? word,
      bool isUpdateMode}) = _$_WordAddAndUpdateState;

  @override
  Flashcard? get parentFlashcard;
  @override
  Word? get word;
  @override
  bool get isUpdateMode;
  @override
  @JsonKey(ignore: true)
  _$WordAddAndUpdateStateCopyWith<_WordAddAndUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}
