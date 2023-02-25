// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_play_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashcardPlayState {
  Flashcard? get flashcard => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;
  dynamic get wordIdToIsFlipped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardPlayStateCopyWith<FlashcardPlayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardPlayStateCopyWith<$Res> {
  factory $FlashcardPlayStateCopyWith(
          FlashcardPlayState value, $Res Function(FlashcardPlayState) then) =
      _$FlashcardPlayStateCopyWithImpl<$Res, FlashcardPlayState>;
  @useResult
  $Res call(
      {Flashcard? flashcard, List<Word> words, dynamic wordIdToIsFlipped});
}

/// @nodoc
class _$FlashcardPlayStateCopyWithImpl<$Res, $Val extends FlashcardPlayState>
    implements $FlashcardPlayStateCopyWith<$Res> {
  _$FlashcardPlayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = freezed,
    Object? words = null,
    Object? wordIdToIsFlipped = freezed,
  }) {
    return _then(_value.copyWith(
      flashcard: freezed == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      wordIdToIsFlipped: freezed == wordIdToIsFlipped
          ? _value.wordIdToIsFlipped
          : wordIdToIsFlipped // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashcardPlayStateCopyWith<$Res>
    implements $FlashcardPlayStateCopyWith<$Res> {
  factory _$$_FlashcardPlayStateCopyWith(_$_FlashcardPlayState value,
          $Res Function(_$_FlashcardPlayState) then) =
      __$$_FlashcardPlayStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Flashcard? flashcard, List<Word> words, dynamic wordIdToIsFlipped});
}

/// @nodoc
class __$$_FlashcardPlayStateCopyWithImpl<$Res>
    extends _$FlashcardPlayStateCopyWithImpl<$Res, _$_FlashcardPlayState>
    implements _$$_FlashcardPlayStateCopyWith<$Res> {
  __$$_FlashcardPlayStateCopyWithImpl(
      _$_FlashcardPlayState _value, $Res Function(_$_FlashcardPlayState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = freezed,
    Object? words = null,
    Object? wordIdToIsFlipped = freezed,
  }) {
    return _then(_$_FlashcardPlayState(
      flashcard: freezed == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      wordIdToIsFlipped: freezed == wordIdToIsFlipped
          ? _value.wordIdToIsFlipped!
          : wordIdToIsFlipped,
    ));
  }
}

/// @nodoc

class _$_FlashcardPlayState implements _FlashcardPlayState {
  _$_FlashcardPlayState(
      {this.flashcard,
      final List<Word> words = const <Word>[],
      this.wordIdToIsFlipped = const <String, bool>{}})
      : _words = words;

  @override
  final Flashcard? flashcard;
  final List<Word> _words;
  @override
  @JsonKey()
  List<Word> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  @JsonKey()
  final dynamic wordIdToIsFlipped;

  @override
  String toString() {
    return 'FlashcardPlayState(flashcard: $flashcard, words: $words, wordIdToIsFlipped: $wordIdToIsFlipped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashcardPlayState &&
            (identical(other.flashcard, flashcard) ||
                other.flashcard == flashcard) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            const DeepCollectionEquality()
                .equals(other.wordIdToIsFlipped, wordIdToIsFlipped));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      flashcard,
      const DeepCollectionEquality().hash(_words),
      const DeepCollectionEquality().hash(wordIdToIsFlipped));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardPlayStateCopyWith<_$_FlashcardPlayState> get copyWith =>
      __$$_FlashcardPlayStateCopyWithImpl<_$_FlashcardPlayState>(
          this, _$identity);
}

abstract class _FlashcardPlayState implements FlashcardPlayState {
  factory _FlashcardPlayState(
      {final Flashcard? flashcard,
      final List<Word> words,
      final dynamic wordIdToIsFlipped}) = _$_FlashcardPlayState;

  @override
  Flashcard? get flashcard;
  @override
  List<Word> get words;
  @override
  dynamic get wordIdToIsFlipped;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardPlayStateCopyWith<_$_FlashcardPlayState> get copyWith =>
      throw _privateConstructorUsedError;
}
