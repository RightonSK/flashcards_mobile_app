import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardProvider =
    StateNotifierProvider<FlashcardNotifier, FlashcardState>(
        (ref) => FlashcardNotifier(FlashcardState()));

class FlashcardNotifier extends StateNotifier<FlashcardState> {
  FlashcardNotifier(FlashcardState state) : super(state);
  final _wordRepository = WordRepository();

  Future init({required Flashcard flashcard}) async {
    passFlashcard(flashcard);
    await fetchWordsOfTheFlashcard(flashcard);
  }

  Future updateWords() async {
    await fetchWordsOfTheFlashcard(state.flashcard!);
  }

  Future passFlashcard(Flashcard flashcard) async {
    state = state.copyWith(flashcard: flashcard);
  }

  Future fetchWordsOfTheFlashcard(Flashcard flashcard) async {
    List<Word> words = await _wordRepository.findAll(flashcard);
    state = state.copyWith(words: words);
  }
}
