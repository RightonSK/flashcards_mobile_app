// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TopStateTearOff {
  const _$TopStateTearOff();

  _TopState call({List<Flashcard> flashcardList = const <Flashcard>[]}) {
    return _TopState(
      flashcardList: flashcardList,
    );
  }
}

/// @nodoc
const $TopState = _$TopStateTearOff();

/// @nodoc
mixin _$TopState {
  List<Flashcard> get flashcardList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopStateCopyWith<TopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopStateCopyWith<$Res> {
  factory $TopStateCopyWith(TopState value, $Res Function(TopState) then) =
      _$TopStateCopyWithImpl<$Res>;
  $Res call({List<Flashcard> flashcardList});
}

/// @nodoc
class _$TopStateCopyWithImpl<$Res> implements $TopStateCopyWith<$Res> {
  _$TopStateCopyWithImpl(this._value, this._then);

  final TopState _value;
  // ignore: unused_field
  final $Res Function(TopState) _then;

  @override
  $Res call({
    Object? flashcardList = freezed,
  }) {
    return _then(_value.copyWith(
      flashcardList: flashcardList == freezed
          ? _value.flashcardList
          : flashcardList // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
    ));
  }
}

/// @nodoc
abstract class _$TopStateCopyWith<$Res> implements $TopStateCopyWith<$Res> {
  factory _$TopStateCopyWith(_TopState value, $Res Function(_TopState) then) =
      __$TopStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Flashcard> flashcardList});
}

/// @nodoc
class __$TopStateCopyWithImpl<$Res> extends _$TopStateCopyWithImpl<$Res>
    implements _$TopStateCopyWith<$Res> {
  __$TopStateCopyWithImpl(_TopState _value, $Res Function(_TopState) _then)
      : super(_value, (v) => _then(v as _TopState));

  @override
  _TopState get _value => super._value as _TopState;

  @override
  $Res call({
    Object? flashcardList = freezed,
  }) {
    return _then(_TopState(
      flashcardList: flashcardList == freezed
          ? _value.flashcardList
          : flashcardList // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TopState implements _TopState {
  _$_TopState({this.flashcardList = const <Flashcard>[]});

  @JsonKey()
  @override
  final List<Flashcard> flashcardList;

  @override
  String toString() {
    return 'TopState(flashcardList: $flashcardList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopState &&
            const DeepCollectionEquality()
                .equals(other.flashcardList, flashcardList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(flashcardList));

  @JsonKey(ignore: true)
  @override
  _$TopStateCopyWith<_TopState> get copyWith =>
      __$TopStateCopyWithImpl<_TopState>(this, _$identity);
}

abstract class _TopState implements TopState {
  factory _TopState({List<Flashcard> flashcardList}) = _$_TopState;

  @override
  List<Flashcard> get flashcardList;
  @override
  @JsonKey(ignore: true)
  _$TopStateCopyWith<_TopState> get copyWith =>
      throw _privateConstructorUsedError;
}
