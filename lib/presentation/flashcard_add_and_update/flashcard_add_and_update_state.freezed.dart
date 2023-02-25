// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_add_and_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashcardAddAndUpdateState {
  bool get isUpdateMode => throw _privateConstructorUsedError;
  Flashcard? get flashcard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardAddAndUpdateStateCopyWith<FlashcardAddAndUpdateState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardAddAndUpdateStateCopyWith<$Res> {
  factory $FlashcardAddAndUpdateStateCopyWith(FlashcardAddAndUpdateState value,
          $Res Function(FlashcardAddAndUpdateState) then) =
      _$FlashcardAddAndUpdateStateCopyWithImpl<$Res,
          FlashcardAddAndUpdateState>;
  @useResult
  $Res call({bool isUpdateMode, Flashcard? flashcard});
}

/// @nodoc
class _$FlashcardAddAndUpdateStateCopyWithImpl<$Res,
        $Val extends FlashcardAddAndUpdateState>
    implements $FlashcardAddAndUpdateStateCopyWith<$Res> {
  _$FlashcardAddAndUpdateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdateMode = null,
    Object? flashcard = freezed,
  }) {
    return _then(_value.copyWith(
      isUpdateMode: null == isUpdateMode
          ? _value.isUpdateMode
          : isUpdateMode // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcard: freezed == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashcardAddAndUpdateStateCopyWith<$Res>
    implements $FlashcardAddAndUpdateStateCopyWith<$Res> {
  factory _$$_FlashcardAddAndUpdateStateCopyWith(
          _$_FlashcardAddAndUpdateState value,
          $Res Function(_$_FlashcardAddAndUpdateState) then) =
      __$$_FlashcardAddAndUpdateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isUpdateMode, Flashcard? flashcard});
}

/// @nodoc
class __$$_FlashcardAddAndUpdateStateCopyWithImpl<$Res>
    extends _$FlashcardAddAndUpdateStateCopyWithImpl<$Res,
        _$_FlashcardAddAndUpdateState>
    implements _$$_FlashcardAddAndUpdateStateCopyWith<$Res> {
  __$$_FlashcardAddAndUpdateStateCopyWithImpl(
      _$_FlashcardAddAndUpdateState _value,
      $Res Function(_$_FlashcardAddAndUpdateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdateMode = null,
    Object? flashcard = freezed,
  }) {
    return _then(_$_FlashcardAddAndUpdateState(
      isUpdateMode: null == isUpdateMode
          ? _value.isUpdateMode
          : isUpdateMode // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcard: freezed == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
    ));
  }
}

/// @nodoc

class _$_FlashcardAddAndUpdateState
    with DiagnosticableTreeMixin
    implements _FlashcardAddAndUpdateState {
  _$_FlashcardAddAndUpdateState({this.isUpdateMode = false, this.flashcard});

  @override
  @JsonKey()
  final bool isUpdateMode;
  @override
  final Flashcard? flashcard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlashcardAddAndUpdateState(isUpdateMode: $isUpdateMode, flashcard: $flashcard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlashcardAddAndUpdateState'))
      ..add(DiagnosticsProperty('isUpdateMode', isUpdateMode))
      ..add(DiagnosticsProperty('flashcard', flashcard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashcardAddAndUpdateState &&
            (identical(other.isUpdateMode, isUpdateMode) ||
                other.isUpdateMode == isUpdateMode) &&
            (identical(other.flashcard, flashcard) ||
                other.flashcard == flashcard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isUpdateMode, flashcard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardAddAndUpdateStateCopyWith<_$_FlashcardAddAndUpdateState>
      get copyWith => __$$_FlashcardAddAndUpdateStateCopyWithImpl<
          _$_FlashcardAddAndUpdateState>(this, _$identity);
}

abstract class _FlashcardAddAndUpdateState
    implements FlashcardAddAndUpdateState {
  factory _FlashcardAddAndUpdateState(
      {final bool isUpdateMode,
      final Flashcard? flashcard}) = _$_FlashcardAddAndUpdateState;

  @override
  bool get isUpdateMode;
  @override
  Flashcard? get flashcard;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardAddAndUpdateStateCopyWith<_$_FlashcardAddAndUpdateState>
      get copyWith => throw _privateConstructorUsedError;
}
