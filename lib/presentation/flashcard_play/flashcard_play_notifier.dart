import 'package:flashcards_mobile_app/app_model.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_play/flashcard_play_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//final flashcardPlayProvider = StateNotifierProvider((ref) => );

final flashcardPlayProvider = StateNotifierProvider.family<
        FlashcardPlayNotifier, FlashcardPlayState, Flashcard>(
    (ref, Flashcard flashcard) =>
        FlashcardPlayNotifier(ref, FlashcardPlayState(), flashcard));

class FlashcardPlayNotifier extends StateNotifier<FlashcardPlayState> {
  FlashcardPlayNotifier(
      this._ref, FlashcardPlayState state, Flashcard flashcard)
      : super(state) {
    init(flashcard: flashcard);
  }

  final _wordRepository = WordRepository();
  final Ref _ref;

  ///
  /// 最初に遷移した時のための初期化メソッド
  ///
  Future init({required Flashcard flashcard}) async {
    passFlashcard(flashcard);
    await fetchWordsOfTheFlashcard();
    createWordIdToIsFlipped();
  }

  ///
  /// flashcardをstateにコピー
  ///
  void passFlashcard(Flashcard flashcard) async {
    state = state.copyWith(flashcard: flashcard);
  }

  ///
  /// このstateのflashcardのwordsをfetch
  ///
  Future fetchWordsOfTheFlashcard() async {
    final user = _ref.read(userProvider);
    List<Word> words = await _wordRepository.findAll(
        uid: user!.uid, flashcard: state.flashcard!);
    state = state.copyWith(words: words);
  }

  ///
  /// wordをflipするのに必要なプロパティを作成しstateに保存
  ///
  void createWordIdToIsFlipped() {
    final Map<String, bool> wordIdToIsFlipped = {};
    for (Word word in state.words) {
      wordIdToIsFlipped[word.id] = false;
    }
    state = state.copyWith(wordIdToIsFlipped: wordIdToIsFlipped);
  }

  ///
  /// タップされたWordのwordIdToIsFlippedのvalue(bool値)を変更
  ///
  void switchTheValueOfWordIdToIsFlipped({required String wordId}) {
    final Map<String, bool> wordIdToIsFlipped = {...state.wordIdToIsFlipped};
    wordIdToIsFlipped.update(wordId, (value) => !value);
    state = state.copyWith(wordIdToIsFlipped: wordIdToIsFlipped);
  }
}
