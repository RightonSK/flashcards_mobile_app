import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardAddAndUpdateProvider = StateNotifierProvider<
        FlashCardAddAndUpdateNotifier, FlashcardAddAndUpdateState>(
    (ref) => FlashCardAddAndUpdateNotifier(FlashcardAddAndUpdateState()));

class FlashCardAddAndUpdateNotifier
    extends StateNotifier<FlashcardAddAndUpdateState> {
  FlashCardAddAndUpdateNotifier(FlashcardAddAndUpdateState state)
      : super(state);
  final _flashCaredRepository = FlashCaredRepository();
  final _wordRepository = WordRepository();

  // flashcardを渡し、stateに保存
  void passFlashcard({required Flashcard flashcard}) {
    state = state.copyWith(flashcard: flashcard);
  }

  // isUpdateModeのbool値の変更
  void switchIsUpdateMode({required bool isUpdateMode}) {
    state = state.copyWith(isUpdateMode: isUpdateMode);
  }

  // flashcardの中身を更新して、それをrepositoryに渡す
  Future addOrUpdateFlashcard({required String title}) async {
    late final Flashcard flashcard;
    if (state.isUpdateMode) {
      flashcard =
          state.flashcard!.copyWith(title: title, updatedAt: DateTime.now());
    } else {
      final newId = _flashCaredRepository.getNewId();
      flashcard = Flashcard(
          id: newId,
          title: title,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    }
    state = state.copyWith(flashcard: flashcard);
    //条件分岐
    if (state.isUpdateMode) {
      await _flashCaredRepository.update(flashcard: state.flashcard!);
    } else {
      await _flashCaredRepository.add(flashCard: state.flashcard!);
    }
  }

  // flashcardをflashcardとwordのrepositoryそれぞれに渡す
  Future deleteFlashcard() async {
    await _wordRepository.deleteAll(flashcardId: state.flashcard!.id);
    await _flashCaredRepository.delete(flashcardId: state.flashcard!.id);
  }
}
