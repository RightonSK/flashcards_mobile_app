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
  final _flashcardRepository = FlashCaredRepository();
  final Ref _ref;

  ///
  /// flashcardsの更新、アクションモードの初期化
  ///
  Future init() async {
    await fetchFlashcards();
    turnOffActionMode();
  }

  // ///
  // /// アプリ立ち上げ時ログイン済みの場合のinit処理。
  // /// 通常のinit()に加えてスプラッシュページを閉じる処理。
  // ///
  // Future initRightAfterAppLaunch() async {
  //   await fetchFlashcards();
  //   // flashcardsをfetchした後に、splash pageをremoveする。
  //   FlutterNativeSplash.remove();
  // }

  ///
  /// Action Modeに関わるプロパティの値を初期化
  ///
  void turnOffActionMode() {
    state = state.copyWith(selectedFlashcard: null);
    print('false Action Mode');
  }

  //flashcardsの取得, 要素はupdatedAtの昇順
  Future fetchFlashcards() async {
    final user = _ref.read(userProvider);
    print('fetchFlashcard(): ${user!.uid}');
    final List<Flashcard> flashcardList =
        await _flashcardRepository.findAll(uid: user.uid);
    flashcardList.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
    state = state.copyWith(flashcardList: flashcardList);
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
}
