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
  Word? get word => throw _privateConstructorUsedError;

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
  $Res call({Word? word});
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
    Object? word = freezed,
  }) {
    return _then(_value.copyWith(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
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
  $Res call({Word? word});
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
    Object? word = freezed,
  }) {
    return _then(_$_WordAddAndUpdateState(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
    ));
  }
}

/// @nodoc

class _$_WordAddAndUpdateState implements _WordAddAndUpdateState {
  _$_WordAddAndUpdateState({this.word});

  @override
  final Word? word;

  @override
  String toString() {
    return 'WordAddAndUpdateState(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordAddAndUpdateState &&
            (identical(other.word, word) || other.word == word));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordAddAndUpdateStateCopyWith<_$_WordAddAndUpdateState> get copyWith =>
      __$$_WordAddAndUpdateStateCopyWithImpl<_$_WordAddAndUpdateState>(
          this, _$identity);
}

abstract class _WordAddAndUpdateState implements WordAddAndUpdateState {
  factory _WordAddAndUpdateState({final Word? word}) = _$_WordAddAndUpdateState;

  @override
  Word? get word;
  @override
  @JsonKey(ignore: true)
  _$$_WordAddAndUpdateStateCopyWith<_$_WordAddAndUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}
