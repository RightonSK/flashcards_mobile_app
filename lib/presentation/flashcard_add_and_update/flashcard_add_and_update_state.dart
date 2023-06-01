import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_add_and_update_state.freezed.dart';

@freezed
class FlashcardAddAndUpdateState with _$FlashcardAddAndUpdateState {
  factory FlashcardAddAndUpdateState({
    Flashcard? flashcard,
  }) = _FlashcardAddAndUpdateState;
}
