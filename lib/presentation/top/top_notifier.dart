import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/top/top_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topProvider = StateNotifierProvider<TopNotifier, TopState>(
    (ref) => TopNotifier(TopState()));

class TopNotifier extends StateNotifier<TopState> {
  TopNotifier(TopState state) : super(state);
  final _flashcardRepository = FlashCaredRepository();

  // flashcardsの更新、変数の初期値化
  Future init() async {
    await fetchFlashcards();
    state = state.copyWith(
        appBarIsStacked: false, isActionMode: false, selectedFlashcard: null);
  }

  //flashcardsの取得, 要素はupdatedAtの昇順
  Future fetchFlashcards() async {
    final List<Flashcard> flashcardList = await _flashcardRepository.findAll();
    flashcardList.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
    state = state.copyWith(flashcardList: flashcardList);
  }

  ///
  /// isActionModeのbool値を変更。
  /// trueならappBarIsStackedをtrueにして、selectedFlashcardをセットする。
  /// falseならappBarIsStackedをfalseにして、selectedFlashcardをnullにする。
  ///
  void switchIsActionMode(
      {required bool isActionMode, Flashcard? selectedFlashcard}) {
    state = state.copyWith(isActionMode: isActionMode);
    if (state.isActionMode) {
      state = state.copyWith(appBarIsStacked: true);
      state = state.copyWith(selectedFlashcard: selectedFlashcard);
    } else {
      state = state.copyWith(appBarIsStacked: false);
      state = state.copyWith(selectedFlashcard: null);
    }
  }

  ///
  /// selectedFlashcardをセットする。
  ///
  void setSelectedFlashcard({required Flashcard selectedFlashcard}) {
    state = state.copyWith(selectedFlashcard: selectedFlashcard);
  }
}
