import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_update_state.freezed.dart';

@freezed
class EmailUpdateState with _$EmailUpdateState {
  factory EmailUpdateState({
    @Default('') String email,
  }) = _EmailUpdateState;
}
