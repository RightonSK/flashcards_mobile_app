import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardProvider = StateNotifierProvider.autoDispose
    .family<FlashcardNotifier, FlashcardState, Flashcard>(
        (ref, Flashcard flashcard) =>
            FlashcardNotifier(ref, const FlashcardState(), flashcard));

class FlashcardNotifier extends StateNotifier<FlashcardState> {
  FlashcardNotifier(this._ref, FlashcardState state, Flashcard flashcard)
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
  /// rebuildの際に使用するメソッド
  /// wordsを再取得して、wordIdToIsFlippedも再度作成
  ///
  Future reBuild() async {
    await fetchWordsOfTheFlashcard();
    createWordIdToIsFlipped();
    turnOffActionMode();
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
    List<Word> words =
        await _wordRepository.findAll(flashcard: state.flashcard!);
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

  ///
  /// wordIdToSelectedWordに新しい要素を追加
  ///
  void turnOnActionMode({required Word selectedWord}) {
    final Map<String, Word> wordIdToSelectedWord = {
      ...state.wordIdToSelectedWord,
      selectedWord.id: selectedWord,
    };
    state = state.copyWith(wordIdToSelectedWord: wordIdToSelectedWord);
  }

  ///
  /// WordIdToSelectedWordの中身を空にする。
  ///
  void turnOffActionMode() {
    state = state.copyWith(wordIdToSelectedWord: <String, Word>{});
  }

  ///
  /// selectedWordをwordIdToSelectedWordに追加する
  ///
  void addWordToWordIdToSelectedWord({required Word selectedWord}) {
    final Map<String, Word> wordIdToSelectedWord = {
      ...state.wordIdToSelectedWord,
      selectedWord.id: selectedWord
    };
    state = state.copyWith(wordIdToSelectedWord: wordIdToSelectedWord);
  }

  ///
  /// selectedWordをwordIdToSelectedWordから取り除く
  ///
  void removeWordFromWordIdToSelectedWord({required Word selectedWord}) {
    final wordIdToSelectedWord = {...state.wordIdToSelectedWord};
    wordIdToSelectedWord.remove(selectedWord.id);
    state = state.copyWith(wordIdToSelectedWord: wordIdToSelectedWord);
  }

  ///
  /// wordIdToSelectedWordが空かどうかを返す
  ///
  bool checkIfWordIdToSelectedWordIsEmpty() {
    return state.wordIdToSelectedWord.isEmpty;
  }

  ///
  /// 削除するwordのidをrepositoryに渡す
  ///
  Future deleteWords() async {
    final List<String> wordIds =
        state.wordIdToSelectedWord.entries.map((e) => e.key).toList();
    await _wordRepository.delete(wordIds: wordIds);
  }
}
