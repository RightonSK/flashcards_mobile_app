import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_state.freezed.dart';

@freezed
class FlashcardState with _$FlashcardState {
  const FlashcardState._();
  const factory FlashcardState({
    Flashcard? flashcard,
    @Default(<Word>[]) List<Word> words,
    @Default(<String, Word>{}) Map<String, Word> wordIdToSelectedWord,
    @Default(<String, bool>{}) wordIdToIsFlipped,
  }) = _FlashcardState;

  bool get isActionMode => wordIdToSelectedWord.isNotEmpty;

  List<Word> get wordsSortedByUpdatedAt {
    List<Word> sortedWords = List.from(words);
    sortedWords.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return sortedWords;
  }
}
