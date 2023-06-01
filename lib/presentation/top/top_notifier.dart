import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/top/top_state.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topProvider = StateNotifierProvider.autoDispose<TopNotifier, TopState>(
    (ref) => TopNotifier(ref, TopState()));

class TopNotifier extends StateNotifier<TopState> {
  TopNotifier(this._ref, TopState state) : super(state) {
    // top providerが最初に呼ばれたタイミングでinit()処理
    init();
  }

  final _flashcardRepository = FlashcardRepository();
  final Ref _ref;

  ///
  /// flashcardsの更新、アクションモードの初期化
  ///
  Future init() async {
    await fetchFlashcards();
    turnOffActionMode();
  }

  ///
  /// selectedFlashcardをnullにする。
  ///
  void turnOffActionMode() {
    state = state.copyWith(selectedFlashcard: null);
  }

  ///
  /// flashcardsの取得
  ///
  Future fetchFlashcards() async {
    final user = _ref.read(userProvider);
    final List<Flashcard> flashcardList =
        await _flashcardRepository.findAll(uid: user!.uid);
    state = state.copyWith(flashcardList: flashcardList);
  }

  ///
  /// selectedFlashcardをセットする。
  ///
  void setSelectedFlashcard({required Flashcard selectedFlashcard}) {
    state = state.copyWith(selectedFlashcard: selectedFlashcard);
  }

  ///
  ///  isPinnedのvalueを変更
  ///
  Future<void> invertIsPinnedOfSelectedFlashcard() async {
    final updatedFlashcard = state.selectedFlashcard!.copyWith(
        isPinned: !state.selectedFlashcard!.isPinned,
        updatedAt: DateTime.now());
    print('isPinned ${updatedFlashcard.isPinned}');
    // flashcardを更新(isPinned, updatedAt)
    await _flashcardRepository.invertIsPinned(flashcard: updatedFlashcard);
  }
}
