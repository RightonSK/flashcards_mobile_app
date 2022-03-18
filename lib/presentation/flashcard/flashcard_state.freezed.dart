// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flashcard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FlashcardStateTearOff {
  const _$FlashcardStateTearOff();

  _FlashcardState call(
      {Flashcard? flashcard, List<Word> words = const <Word>[]}) {
    return _FlashcardState(
      flashcard: flashcard,
      words: words,
    );
  }
}

/// @nodoc
const $FlashcardState = _$FlashcardStateTearOff();

/// @nodoc
mixin _$FlashcardState {
  Flashcard? get flashcard => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardStateCopyWith<FlashcardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardStateCopyWith<$Res> {
  factory $FlashcardStateCopyWith(
          FlashcardState value, $Res Function(FlashcardState) then) =
      _$FlashcardStateCopyWithImpl<$Res>;
  $Res call({Flashcard? flashcard, List<Word> words});
}

/// @nodoc
class _$FlashcardStateCopyWithImpl<$Res>
    implements $FlashcardStateCopyWith<$Res> {
  _$FlashcardStateCopyWithImpl(this._value, this._then);

  final FlashcardState _value;
  // ignore: unused_field
  final $Res Function(FlashcardState) _then;

  @override
  $Res call({
    Object? flashcard = freezed,
    Object? words = freezed,
  }) {
    return _then(_value.copyWith(
      flashcard: flashcard == freezed
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
abstract class _$FlashcardStateCopyWith<$Res>
    implements $FlashcardStateCopyWith<$Res> {
  factory _$FlashcardStateCopyWith(
          _FlashcardState value, $Res Function(_FlashcardState) then) =
      __$FlashcardStateCopyWithImpl<$Res>;
  @override
  $Res call({Flashcard? flashcard, List<Word> words});
}

/// @nodoc
class __$FlashcardStateCopyWithImpl<$Res>
    extends _$FlashcardStateCopyWithImpl<$Res>
    implements _$FlashcardStateCopyWith<$Res> {
  __$FlashcardStateCopyWithImpl(
      _FlashcardState _value, $Res Function(_FlashcardState) _then)
      : super(_value, (v) => _then(v as _FlashcardState));

  @override
  _FlashcardState get _value => super._value as _FlashcardState;

  @override
  $Res call({
    Object? flashcard = freezed,
    Object? words = freezed,
  }) {
    return _then(_FlashcardState(
      flashcard: flashcard == freezed
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FlashcardState implements _FlashcardState {
  _$_FlashcardState({this.flashcard, this.words = const <Word>[]});

  @override
  final Flashcard? flashcard;
  @JsonKey()
  @override
  final List<Word> words;

  @override
  String toString() {
    return 'FlashcardState(flashcard: $flashcard, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlashcardState &&
            const DeepCollectionEquality().equals(other.flashcard, flashcard) &&
            const DeepCollectionEquality().equals(other.words, words));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(flashcard),
      const DeepCollectionEquality().hash(words));

  @JsonKey(ignore: true)
  @override
  _$FlashcardStateCopyWith<_FlashcardState> get copyWith =>
      __$FlashcardStateCopyWithImpl<_FlashcardState>(this, _$identity);
}

abstract class _FlashcardState implements FlashcardState {
  factory _FlashcardState({Flashcard? flashcard, List<Word> words}) =
      _$_FlashcardState;

  @override
  Flashcard? get flashcard;
  @override
  List<Word> get words;
  @override
  @JsonKey(ignore: true)
  _$FlashcardStateCopyWith<_FlashcardState> get copyWith =>
      throw _privateConstructorUsedError;
}
