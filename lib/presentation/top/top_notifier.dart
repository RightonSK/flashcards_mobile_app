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
    print('top notifier constructor');
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
  /// Action Modeに関わるプロパティの値を初期化
  ///
  void turnOffActionMode() {
    state = state.copyWith(selectedFlashcard: null);
    print('false Action Mode');
  }

  //flashcardsの取得
  Future fetchFlashcards() async {
    final user = _ref.read(userProvider);
    print('fetchFlashcard(): ${user!.uid}');
    final List<Flashcard> flashcardList =
        await _flashcardRepository.findAll(uid: user.uid);
    print(flashcardList == null
        ? 'flashcardList is null'
        : 'flashcardList is not null');
    state = state.copyWith(flashcardList: flashcardList);
    print(flashcardList == null);
  }

  ///
  /// isActionModeのbool値を変更。
  /// trueならappBarIsStackedをtrueにして、selectedFlashcardをセットする。
  /// falseならappBarIsStackedをfalseにして、selectedFlashcardをnullにする。
  ///
  // void switchIsActionMode(
  //     {required bool isActionMode, required Flashcard? selectedFlashcard}) {
  //   state = state.copyWith(isActionMode: isActionMode);
  //   if (state.isActionMode) {
  //     state = state.copyWith(appBarIsStacked: true);
  //     state = state.copyWith(selectedFlashcard: selectedFlashcard);
  //   } else {
  //     state = state.copyWith(appBarIsStacked: false);
  //     state = state.copyWith(selectedFlashcard: null);
  //   }
  // }

  ///
  /// selectedFlashcardをセットする。
  ///
  void setSelectedFlashcard({required Flashcard selectedFlashcard}) {
    state = state.copyWith(selectedFlashcard: selectedFlashcard);
  }

  void removeSelectedFlashcard() {
    state = state.copyWith(selectedFlashcard: null);
  }

  ///
  ///  isPinnedのvalueを変更
  ///
  Future<void> invertIsPinnedOfSelectedFlashcard() async {
    final updatedFlashcard = state.selectedFlashcard!
        .copyWith(isPinned: !state.selectedFlashcard!.isPinned);
    print('isPinned ${updatedFlashcard.isPinned}');
    // DBのデータを更新し、stateも更新
    await _flashcardRepository.invertIsPinned(flashcard: updatedFlashcard);
    //state = state.copyWith(selectedFlashcard: updatedFlashcard);
  }
}
