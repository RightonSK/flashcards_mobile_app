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
    @Default(TextSizeOption.medium) TextSizeOption textSizeOption,
  }) = _FlashcardPlayState;
}

enum TextSizeOption {
  small, medium, large, extraLarge;

  double get size {
    switch (this) {
      case TextSizeOption.small:
        return 16.0;
      case TextSizeOption.medium:
        return 20.0;
      case TextSizeOption.large:
        return 24.0;
      case TextSizeOption.extraLarge:
        return 28.0;
      default:
        return 20.0;
    }
  }
}