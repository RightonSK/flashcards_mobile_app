import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardAddAndUpdateProvider = StateNotifierProvider.autoDispose.family<
        FlashcardAddAndUpdateNotifier, FlashcardAddAndUpdateState, Flashcard?>(
    (ref, Flashcard? flashcard) => FlashcardAddAndUpdateNotifier(
        ref, FlashcardAddAndUpdateState(), flashcard));

class FlashcardAddAndUpdateNotifier
    extends StateNotifier<FlashcardAddAndUpdateState> {
  FlashcardAddAndUpdateNotifier(
      this._ref, FlashcardAddAndUpdateState state, Flashcard? flashcard)
      : super(state) {
    // 更新モードの時のみflashcardをstateに渡す。
    if (flashcard != null) {
      passFlashcard(flashcard: flashcard);
    }
  }
  final _flashcardRepository = FlashcardRepository();
  final _wordRepository = WordRepository();
  final Ref _ref;

  ///
  /// flashcardを渡し、stateに保存
  ///
  void passFlashcard({required Flashcard flashcard}) {
    state = state.copyWith(flashcard: flashcard);
  }

  ///
  /// flashcardの中身を更新して、それをrepositoryに渡す
  ///
  Future addOrUpdateFlashcard(
      {required String title, required bool isUpdateMode}) async {
    if (title.isEmpty) {
      throw const FormatException('タイトルを入力して下さい');
    }
    final user = _ref.read(userProvider);
    final Flashcard flashcard;
    if (isUpdateMode) {
      flashcard =
          state.flashcard!.copyWith(title: title, updatedAt: DateTime.now());
    } else {
      final newId = _flashcardRepository.getNewId();
      flashcard = Flashcard(
          id: newId,
          uid: user!.uid,
          title: title,
          isPinned: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    }
    state = state.copyWith(flashcard: flashcard);
    // add or update分岐
    if (isUpdateMode) {
      await _flashcardRepository.update(flashcard: state.flashcard!);
    } else {
      await _flashcardRepository.add(flashcard: state.flashcard!);
    }
  }

  ///
  /// flashcardをflashcardとwordのrepositoryそれぞれに渡す
  ///
  Future deleteFlashcard() async {
    await _wordRepository.deleteAll(flashcardId: state.flashcard!.id);
    await _flashcardRepository.delete(flashcardId: state.flashcard!.id);
  }
}
