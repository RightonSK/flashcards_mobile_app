// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashcardState {
  Flashcard? get flashcard => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;
  Map<String, Word> get wordIdToSelectedWord =>
      throw _privateConstructorUsedError;
  dynamic get wordIdToIsFlipped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardStateCopyWith<FlashcardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardStateCopyWith<$Res> {
  factory $FlashcardStateCopyWith(
          FlashcardState value, $Res Function(FlashcardState) then) =
      _$FlashcardStateCopyWithImpl<$Res, FlashcardState>;
  @useResult
  $Res call(
      {Flashcard? flashcard,
      List<Word> words,
      Map<String, Word> wordIdToSelectedWord,
      dynamic wordIdToIsFlipped});
}

/// @nodoc
class _$FlashcardStateCopyWithImpl<$Res, $Val extends FlashcardState>
    implements $FlashcardStateCopyWith<$Res> {
  _$FlashcardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = freezed,
    Object? words = null,
    Object? wordIdToSelectedWord = null,
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
      wordIdToSelectedWord: null == wordIdToSelectedWord
          ? _value.wordIdToSelectedWord
          : wordIdToSelectedWord // ignore: cast_nullable_to_non_nullable
              as Map<String, Word>,
      wordIdToIsFlipped: freezed == wordIdToIsFlipped
          ? _value.wordIdToIsFlipped
          : wordIdToIsFlipped // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashcardStateCopyWith<$Res>
    implements $FlashcardStateCopyWith<$Res> {
  factory _$$_FlashcardStateCopyWith(
          _$_FlashcardState value, $Res Function(_$_FlashcardState) then) =
      __$$_FlashcardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Flashcard? flashcard,
      List<Word> words,
      Map<String, Word> wordIdToSelectedWord,
      dynamic wordIdToIsFlipped});
}

/// @nodoc
class __$$_FlashcardStateCopyWithImpl<$Res>
    extends _$FlashcardStateCopyWithImpl<$Res, _$_FlashcardState>
    implements _$$_FlashcardStateCopyWith<$Res> {
  __$$_FlashcardStateCopyWithImpl(
      _$_FlashcardState _value, $Res Function(_$_FlashcardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = freezed,
    Object? words = null,
    Object? wordIdToSelectedWord = null,
    Object? wordIdToIsFlipped = freezed,
  }) {
    return _then(_$_FlashcardState(
      flashcard: freezed == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      wordIdToSelectedWord: null == wordIdToSelectedWord
          ? _value._wordIdToSelectedWord
          : wordIdToSelectedWord // ignore: cast_nullable_to_non_nullable
              as Map<String, Word>,
      wordIdToIsFlipped: freezed == wordIdToIsFlipped
          ? _value.wordIdToIsFlipped!
          : wordIdToIsFlipped,
    ));
  }
}

/// @nodoc

class _$_FlashcardState extends _FlashcardState {
  const _$_FlashcardState(
      {this.flashcard,
      final List<Word> words = const <Word>[],
      final Map<String, Word> wordIdToSelectedWord = const <String, Word>{},
      this.wordIdToIsFlipped = const <String, bool>{}})
      : _words = words,
        _wordIdToSelectedWord = wordIdToSelectedWord,
        super._();

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

  final Map<String, Word> _wordIdToSelectedWord;
  @override
  @JsonKey()
  Map<String, Word> get wordIdToSelectedWord {
    if (_wordIdToSelectedWord is EqualUnmodifiableMapView)
      return _wordIdToSelectedWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_wordIdToSelectedWord);
  }

  @override
  @JsonKey()
  final dynamic wordIdToIsFlipped;

  @override
  String toString() {
    return 'FlashcardState(flashcard: $flashcard, words: $words, wordIdToSelectedWord: $wordIdToSelectedWord, wordIdToIsFlipped: $wordIdToIsFlipped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashcardState &&
            (identical(other.flashcard, flashcard) ||
                other.flashcard == flashcard) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            const DeepCollectionEquality()
                .equals(other._wordIdToSelectedWord, _wordIdToSelectedWord) &&
            const DeepCollectionEquality()
                .equals(other.wordIdToIsFlipped, wordIdToIsFlipped));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      flashcard,
      const DeepCollectionEquality().hash(_words),
      const DeepCollectionEquality().hash(_wordIdToSelectedWord),
      const DeepCollectionEquality().hash(wordIdToIsFlipped));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardStateCopyWith<_$_FlashcardState> get copyWith =>
      __$$_FlashcardStateCopyWithImpl<_$_FlashcardState>(this, _$identity);
}

abstract class _FlashcardState extends FlashcardState {
  const factory _FlashcardState(
      {final Flashcard? flashcard,
      final List<Word> words,
      final Map<String, Word> wordIdToSelectedWord,
      final dynamic wordIdToIsFlipped}) = _$_FlashcardState;
  const _FlashcardState._() : super._();

  @override
  Flashcard? get flashcard;
  @override
  List<Word> get words;
  @override
  Map<String, Word> get wordIdToSelectedWord;
  @override
  dynamic get wordIdToIsFlipped;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardStateCopyWith<_$_FlashcardState> get copyWith =>
      throw _privateConstructorUsedError;
}
