import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardAddAndUpdateProvider = StateNotifierProvider.autoDispose.family<
        FlashCardAddAndUpdateNotifier, FlashcardAddAndUpdateState, Flashcard?>(
    (ref, Flashcard? flashcard) => FlashCardAddAndUpdateNotifier(
        ref, FlashcardAddAndUpdateState(), flashcard));

class FlashCardAddAndUpdateNotifier
    extends StateNotifier<FlashcardAddAndUpdateState> {
  FlashCardAddAndUpdateNotifier(
      this._ref, FlashcardAddAndUpdateState state, Flashcard? flashcard)
      : super(state) {
    print('flashcardAddAndUpdateNotifier constructor');
    // 更新モードの時のみflashcardをstateに渡す。
    if (flashcard != null) {
      passFlashcard(flashcard: flashcard);
    }
  }
  final _flashCaredRepository = FlashCaredRepository();
  final _wordRepository = WordRepository();
  final Ref _ref;

  // flashcardを渡し、stateに保存
  void passFlashcard({required Flashcard flashcard}) {
    state = state.copyWith(flashcard: flashcard);
  }

  // isUpdateModeのbool値の変更
  void switchIsUpdateMode({required bool isUpdateMode}) {
    state = state.copyWith(isUpdateMode: isUpdateMode);
  }

  // flashcardの中身を更新して、それをrepositoryに渡す
  Future addOrUpdateFlashcard(
      {required String title, required bool isUpdateMode}) async {
    final user = _ref.read(userProvider);
    final Flashcard flashcard;
    if (isUpdateMode) {
      flashcard =
          state.flashcard!.copyWith(title: title, updatedAt: DateTime.now());
    } else {
      final newId = _flashCaredRepository.getNewId();
      flashcard = Flashcard(
          id: newId,
          uid: user!.uid,
          title: title,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    }
    state = state.copyWith(flashcard: flashcard);
    // add or update分岐
    if (isUpdateMode) {
      await _flashCaredRepository.update(
          uid: user!.uid, flashcard: state.flashcard!);
    } else {
      await _flashCaredRepository.add(flashCard: state.flashcard!);
    }
  }

  // flashcardをflashcardとwordのrepositoryそれぞれに渡す
  Future deleteFlashcard() async {
    final user = _ref.read(userProvider);
    await _wordRepository.deleteAll(
        uid: user!.uid, flashcardId: state.flashcard!.id);
    await _flashCaredRepository.delete(
        uid: user.uid, flashcardId: state.flashcard!.id);
  }
}
