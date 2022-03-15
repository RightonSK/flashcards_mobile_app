import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_add_and_update_state.freezed.dart';

@freezed
class FlashcardAddAndUpdateState with _$FlashcardAddAndUpdateState {
  @JsonSerializable(explicitToJson: true)
  factory FlashcardAddAndUpdateState({
    @Default('1') String mode,
    required Flashcard flashcard,
  }) = _FlashcardAddAndUpdateState;
}
