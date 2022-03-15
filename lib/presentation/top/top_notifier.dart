import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/top/top_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topProvider = StateNotifierProvider<TopNotifier, TopState>(
    (ref) => TopNotifier(TopState()));

class TopNotifier extends StateNotifier<TopState> {
  TopNotifier(TopState state) : super(state);
  final _flashcardRepository = FlashCaredRepository();

  Future fetchFlashcardList() async {
    final List<Flashcard> flashcardList =
        await _flashcardRepository.fetchAllFlashcards();
    state = state.copyWith(flashcardList: flashcardList);
  }
}
