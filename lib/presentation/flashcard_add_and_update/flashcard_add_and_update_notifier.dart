import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardAddAndUpdateProvider = StateNotifierProvider<
        FlashCardAddAndUpdateNotifier, FlashcardAddAndUpdateState>(
    (ref) => FlashCardAddAndUpdateNotifier(FlashcardAddAndUpdateState(
        flashcard: Flashcard(
            id: '',
            title: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now()))));

class FlashCardAddAndUpdateNotifier
    extends StateNotifier<FlashcardAddAndUpdateState> {
  FlashCardAddAndUpdateNotifier(FlashcardAddAndUpdateState state)
      : super(state);

  final _flashCaredRepository = FlashCaredRepository();

  Future editFlashcard({required String title}) async {
    late final Flashcard flashcard;
    //新規追加の場合、新しいidを取得
    if (state.mode != '2') {
      // 1が新規作成モード
      final newId = _flashCaredRepository.getNewId();
      flashcard = state.flashcard.copyWith(id: newId, title: title);
    } else {
      flashcard = state.flashcard.copyWith(title: title);
    }

    state = state.copyWith(flashcard: flashcard);
    await _flashCaredRepository.editFlashcard(flashCard: state.flashcard);
  }
}
