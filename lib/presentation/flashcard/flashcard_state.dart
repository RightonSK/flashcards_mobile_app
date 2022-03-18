import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_state.freezed.dart';

@freezed
class FlashcardState with _$FlashcardState {
  @JsonSerializable(explicitToJson: true)
  factory FlashcardState({
    Flashcard? flashcard,
    @Default(<Word>[]) List<Word> words,
  }) = _FlashcardState;
}
