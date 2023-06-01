import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_play_state.freezed.dart';

@freezed
class FlashcardPlayState with _$FlashcardPlayState {
  const FlashcardPlayState._();
  const factory FlashcardPlayState({
    Flashcard? flashcard,
    @Default(<Word>[]) List<Word> words,
    @Default(<String, bool>{}) wordIdToIsFlipped,
    @Default(1) int currentPageNumber,
  }) = _FlashcardPlayState;
}
