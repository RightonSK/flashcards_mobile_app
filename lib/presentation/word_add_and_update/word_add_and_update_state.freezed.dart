// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_add_and_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$WordAddAndUpdateStateCopyWithImpl<$Res, WordAddAndUpdateState>;
  @useResult
  $Res call({Flashcard? parentFlashcard, Word? word, bool isUpdateMode});
}

/// @nodoc
class _$WordAddAndUpdateStateCopyWithImpl<$Res,
        $Val extends WordAddAndUpdateState>
    implements $WordAddAndUpdateStateCopyWith<$Res> {
  _$WordAddAndUpdateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentFlashcard = freezed,
    Object? word = freezed,
    Object? isUpdateMode = null,
  }) {
    return _then(_value.copyWith(
      parentFlashcard: freezed == parentFlashcard
          ? _value.parentFlashcard
          : parentFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      isUpdateMode: null == isUpdateMode
          ? _value.isUpdateMode
          : isUpdateMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordAddAndUpdateStateCopyWith<$Res>
    implements $WordAddAndUpdateStateCopyWith<$Res> {
  factory _$$_WordAddAndUpdateStateCopyWith(_$_WordAddAndUpdateState value,
          $Res Function(_$_WordAddAndUpdateState) then) =
      __$$_WordAddAndUpdateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Flashcard? parentFlashcard, Word? word, bool isUpdateMode});
}

/// @nodoc
class __$$_WordAddAndUpdateStateCopyWithImpl<$Res>
    extends _$WordAddAndUpdateStateCopyWithImpl<$Res, _$_WordAddAndUpdateState>
    implements _$$_WordAddAndUpdateStateCopyWith<$Res> {
  __$$_WordAddAndUpdateStateCopyWithImpl(_$_WordAddAndUpdateState _value,
      $Res Function(_$_WordAddAndUpdateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentFlashcard = freezed,
    Object? word = freezed,
    Object? isUpdateMode = null,
  }) {
    return _then(_$_WordAddAndUpdateState(
      parentFlashcard: freezed == parentFlashcard
          ? _value.parentFlashcard
          : parentFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      isUpdateMode: null == isUpdateMode
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
  @override
  @JsonKey()
  final bool isUpdateMode;

  @override
  String toString() {
    return 'WordAddAndUpdateState(parentFlashcard: $parentFlashcard, word: $word, isUpdateMode: $isUpdateMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordAddAndUpdateState &&
            (identical(other.parentFlashcard, parentFlashcard) ||
                other.parentFlashcard == parentFlashcard) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.isUpdateMode, isUpdateMode) ||
                other.isUpdateMode == isUpdateMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, parentFlashcard, word, isUpdateMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordAddAndUpdateStateCopyWith<_$_WordAddAndUpdateState> get copyWith =>
      __$$_WordAddAndUpdateStateCopyWithImpl<_$_WordAddAndUpdateState>(
          this, _$identity);
}

abstract class _WordAddAndUpdateState implements WordAddAndUpdateState {
  factory _WordAddAndUpdateState(
      {final Flashcard? parentFlashcard,
      final Word? word,
      final bool isUpdateMode}) = _$_WordAddAndUpdateState;

  @override
  Flashcard? get parentFlashcard;
  @override
  Word? get word;
  @override
  bool get isUpdateMode;
  @override
  @JsonKey(ignore: true)
  _$$_WordAddAndUpdateStateCopyWith<_$_WordAddAndUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}
