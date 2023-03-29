// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailUpdateState {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailUpdateStateCopyWith<EmailUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailUpdateStateCopyWith<$Res> {
  factory $EmailUpdateStateCopyWith(
          EmailUpdateState value, $Res Function(EmailUpdateState) then) =
      _$EmailUpdateStateCopyWithImpl<$Res, EmailUpdateState>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailUpdateStateCopyWithImpl<$Res, $Val extends EmailUpdateState>
    implements $EmailUpdateStateCopyWith<$Res> {
  _$EmailUpdateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailUpdateStateCopyWith<$Res>
    implements $EmailUpdateStateCopyWith<$Res> {
  factory _$$_EmailUpdateStateCopyWith(
          _$_EmailUpdateState value, $Res Function(_$_EmailUpdateState) then) =
      __$$_EmailUpdateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_EmailUpdateStateCopyWithImpl<$Res>
    extends _$EmailUpdateStateCopyWithImpl<$Res, _$_EmailUpdateState>
    implements _$$_EmailUpdateStateCopyWith<$Res> {
  __$$_EmailUpdateStateCopyWithImpl(
      _$_EmailUpdateState _value, $Res Function(_$_EmailUpdateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_EmailUpdateState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailUpdateState
    with DiagnosticableTreeMixin
    implements _EmailUpdateState {
  _$_EmailUpdateState({this.email = ''});

  @override
  @JsonKey()
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmailUpdateState(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmailUpdateState'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailUpdateState &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailUpdateStateCopyWith<_$_EmailUpdateState> get copyWith =>
      __$$_EmailUpdateStateCopyWithImpl<_$_EmailUpdateState>(this, _$identity);
}

abstract class _EmailUpdateState implements EmailUpdateState {
  factory _EmailUpdateState({final String email}) = _$_EmailUpdateState;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_EmailUpdateStateCopyWith<_$_EmailUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}
