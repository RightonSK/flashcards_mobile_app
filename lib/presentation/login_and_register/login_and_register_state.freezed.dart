// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_and_register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginAndRegisterState {
  bool get isLoginMode => throw _privateConstructorUsedError; ////
  List<Flashcard> get flashcardList => throw _privateConstructorUsedError;
  Flashcard? get selectedFlashcard => throw _privateConstructorUsedError;
  bool get appBarIsStacked => throw _privateConstructorUsedError;
  bool get isActionMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginAndRegisterStateCopyWith<LoginAndRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginAndRegisterStateCopyWith<$Res> {
  factory $LoginAndRegisterStateCopyWith(LoginAndRegisterState value,
          $Res Function(LoginAndRegisterState) then) =
      _$LoginAndRegisterStateCopyWithImpl<$Res, LoginAndRegisterState>;
  @useResult
  $Res call(
      {bool isLoginMode,
      List<Flashcard> flashcardList,
      Flashcard? selectedFlashcard,
      bool appBarIsStacked,
      bool isActionMode});
}

/// @nodoc
class _$LoginAndRegisterStateCopyWithImpl<$Res,
        $Val extends LoginAndRegisterState>
    implements $LoginAndRegisterStateCopyWith<$Res> {
  _$LoginAndRegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoginMode = null,
    Object? flashcardList = null,
    Object? selectedFlashcard = freezed,
    Object? appBarIsStacked = null,
    Object? isActionMode = null,
  }) {
    return _then(_value.copyWith(
      isLoginMode: null == isLoginMode
          ? _value.isLoginMode
          : isLoginMode // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcardList: null == flashcardList
          ? _value.flashcardList
          : flashcardList // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      selectedFlashcard: freezed == selectedFlashcard
          ? _value.selectedFlashcard
          : selectedFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      appBarIsStacked: null == appBarIsStacked
          ? _value.appBarIsStacked
          : appBarIsStacked // ignore: cast_nullable_to_non_nullable
              as bool,
      isActionMode: null == isActionMode
          ? _value.isActionMode
          : isActionMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginAndRegisterStateCopyWith<$Res>
    implements $LoginAndRegisterStateCopyWith<$Res> {
  factory _$$_LoginAndRegisterStateCopyWith(_$_LoginAndRegisterState value,
          $Res Function(_$_LoginAndRegisterState) then) =
      __$$_LoginAndRegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoginMode,
      List<Flashcard> flashcardList,
      Flashcard? selectedFlashcard,
      bool appBarIsStacked,
      bool isActionMode});
}

/// @nodoc
class __$$_LoginAndRegisterStateCopyWithImpl<$Res>
    extends _$LoginAndRegisterStateCopyWithImpl<$Res, _$_LoginAndRegisterState>
    implements _$$_LoginAndRegisterStateCopyWith<$Res> {
  __$$_LoginAndRegisterStateCopyWithImpl(_$_LoginAndRegisterState _value,
      $Res Function(_$_LoginAndRegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoginMode = null,
    Object? flashcardList = null,
    Object? selectedFlashcard = freezed,
    Object? appBarIsStacked = null,
    Object? isActionMode = null,
  }) {
    return _then(_$_LoginAndRegisterState(
      isLoginMode: null == isLoginMode
          ? _value.isLoginMode
          : isLoginMode // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcardList: null == flashcardList
          ? _value._flashcardList
          : flashcardList // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      selectedFlashcard: freezed == selectedFlashcard
          ? _value.selectedFlashcard
          : selectedFlashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard?,
      appBarIsStacked: null == appBarIsStacked
          ? _value.appBarIsStacked
          : appBarIsStacked // ignore: cast_nullable_to_non_nullable
              as bool,
      isActionMode: null == isActionMode
          ? _value.isActionMode
          : isActionMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginAndRegisterState implements _LoginAndRegisterState {
  _$_LoginAndRegisterState(
      {this.isLoginMode = true,
      final List<Flashcard> flashcardList = const <Flashcard>[],
      this.selectedFlashcard,
      this.appBarIsStacked = false,
      this.isActionMode = false})
      : _flashcardList = flashcardList;

  @override
  @JsonKey()
  final bool isLoginMode;
////
  final List<Flashcard> _flashcardList;
////
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
  @JsonKey()
  final bool appBarIsStacked;
  @override
  @JsonKey()
  final bool isActionMode;

  @override
  String toString() {
    return 'LoginAndRegisterState(isLoginMode: $isLoginMode, flashcardList: $flashcardList, selectedFlashcard: $selectedFlashcard, appBarIsStacked: $appBarIsStacked, isActionMode: $isActionMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginAndRegisterState &&
            (identical(other.isLoginMode, isLoginMode) ||
                other.isLoginMode == isLoginMode) &&
            const DeepCollectionEquality()
                .equals(other._flashcardList, _flashcardList) &&
            (identical(other.selectedFlashcard, selectedFlashcard) ||
                other.selectedFlashcard == selectedFlashcard) &&
            (identical(other.appBarIsStacked, appBarIsStacked) ||
                other.appBarIsStacked == appBarIsStacked) &&
            (identical(other.isActionMode, isActionMode) ||
                other.isActionMode == isActionMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoginMode,
      const DeepCollectionEquality().hash(_flashcardList),
      selectedFlashcard,
      appBarIsStacked,
      isActionMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginAndRegisterStateCopyWith<_$_LoginAndRegisterState> get copyWith =>
      __$$_LoginAndRegisterStateCopyWithImpl<_$_LoginAndRegisterState>(
          this, _$identity);
}

abstract class _LoginAndRegisterState implements LoginAndRegisterState {
  factory _LoginAndRegisterState(
      {final bool isLoginMode,
      final List<Flashcard> flashcardList,
      final Flashcard? selectedFlashcard,
      final bool appBarIsStacked,
      final bool isActionMode}) = _$_LoginAndRegisterState;

  @override
  bool get isLoginMode;
  @override ////
  List<Flashcard> get flashcardList;
  @override
  Flashcard? get selectedFlashcard;
  @override
  bool get appBarIsStacked;
  @override
  bool get isActionMode;
  @override
  @JsonKey(ignore: true)
  _$$_LoginAndRegisterStateCopyWith<_$_LoginAndRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
