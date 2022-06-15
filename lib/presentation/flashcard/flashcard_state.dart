import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_state.freezed.dart';

@freezed
class FlashcardState with _$FlashcardState {
  factory FlashcardState({
    Flashcard? flashcard,
    @Default(<Word>[]) List<Word> words,
    @Default(<String, Word>{}) Map<String, Word> wordIdToSelectedWord,
    //@Default(<Word>[]) List<Word> selectedWords,
    @Default(false) appBarIsStacked,
    @Default(false) bool isActionMode,
    @Default(<String, bool>{}) wordIdToIsFlipped,
  }) = _FlashcardState;
}
