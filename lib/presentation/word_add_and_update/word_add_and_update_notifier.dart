import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordAddAndUpdateProvider =
    StateNotifierProvider<WordAddAndUpdateNotifier, WordAddAndUpdateState>(
        (ref) => WordAddAndUpdateNotifier(WordAddAndUpdateState()));

class WordAddAndUpdateNotifier extends StateNotifier<WordAddAndUpdateState> {
  WordAddAndUpdateNotifier(WordAddAndUpdateState state) : super(state);
  final _wordRepository = WordRepository();

  Future setWord({required String name, required String description}) async {
    String newId =
        _wordRepository.getNewId(flashcardId: state.parentFlashcard!.id);
    Word word = Word(
        id: newId,
        name: name,
        description: description,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    await _wordRepository.setWord(
        word: word, parentFlashcard: state.parentFlashcard!);
  }

  Future passFlashcard({required Flashcard flashcard}) async {
    state = state.copyWith(parentFlashcard: flashcard);
  }
}
