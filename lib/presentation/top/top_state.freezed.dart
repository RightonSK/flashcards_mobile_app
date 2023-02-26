// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopState {
  List<Flashcard> get flashcardList => throw _privateConstructorUsedError;
  Flashcard? get selectedFlashcard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopStateCopyWith<TopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopStateCopyWith<$Res> {
  factory $TopStateCopyWith(TopState value, $Res Function(TopState) then) =
      _$TopStateCopyWithImpl<$Res, TopState>;
  @useResult
  $Res call({List<Flashcard> flashcardList, Flashcard? selectedFlashcard});
}

/// @nodoc
class _$TopStateCopyWithImpl<$Res, $Val extends TopState>
    implements $TopStateCopyWith<$Res> {
  _$TopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcardList = null,
    Object? selectedFlashcard = freezed,
  }) {
    return _then(_value.copyWith(
      flashcardList: null == flashcardList
          ? _value.flashcardList
          : flashcardList // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      selectedFlashcard: freezed == selectedFlashcard
          ? _value.selectedFlashcard
          : selectedFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopStateCopyWith<$Res> implements $TopStateCopyWith<$Res> {
  factory _$$_TopStateCopyWith(
          _$_TopState value, $Res Function(_$_TopState) then) =
      __$$_TopStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Flashcard> flashcardList, Flashcard? selectedFlashcard});
}

/// @nodoc
class __$$_TopStateCopyWithImpl<$Res>
    extends _$TopStateCopyWithImpl<$Res, _$_TopState>
    implements _$$_TopStateCopyWith<$Res> {
  __$$_TopStateCopyWithImpl(
      _$_TopState _value, $Res Function(_$_TopState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcardList = null,
    Object? selectedFlashcard = freezed,
  }) {
    return _then(_$_TopState(
      flashcardList: null == flashcardList
          ? _value._flashcardList
          : flashcardList // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      selectedFlashcard: freezed == selectedFlashcard
          ? _value.selectedFlashcard
          : selectedFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
    ));
  }
}

/// @nodoc

class _$_TopState extends _TopState {
  const _$_TopState(
      {final List<Flashcard> flashcardList = const <Flashcard>[],
      this.selectedFlashcard})
      : _flashcardList = flashcardList,
        super._();

  final List<Flashcard> _flashcardList;
  @override
  @JsonKey()
  List<Flashcard> get flashcardList {
    if (_flashcardList is EqualUnmodifiableListView) return _flashcardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashcardList);
  }

  @override
  final Flashcard? selectedFlashcard;

  @override
  String toString() {
    return 'TopState(flashcardList: $flashcardList, selectedFlashcard: $selectedFlashcard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopState &&
            const DeepCollectionEquality()
                .equals(other._flashcardList, _flashcardList) &&
            (identical(other.selectedFlashcard, selectedFlashcard) ||
                other.selectedFlashcard == selectedFlashcard));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_flashcardList), selectedFlashcard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopStateCopyWith<_$_TopState> get copyWith =>
      __$$_TopStateCopyWithImpl<_$_TopState>(this, _$identity);
}

abstract class _TopState extends TopState {
  const factory _TopState(
      {final List<Flashcard> flashcardList,
      final Flashcard? selectedFlashcard}) = _$_TopState;
  const _TopState._() : super._();

  @override
  List<Flashcard> get flashcardList;
  @override
  Flashcard? get selectedFlashcard;
  @override
  @JsonKey(ignore: true)
  _$$_TopStateCopyWith<_$_TopState> get copyWith =>
      throw _privateConstructorUsedError;
}
