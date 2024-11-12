import 'dart:math';

import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_play/flashcard_play_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flashcardPlayProvider = StateNotifierProvider.autoDispose
    .family<FlashcardPlayNotifier, FlashcardPlayState, Flashcard>(
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
  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

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
  /// このstateのflashcardのwordsをfetchし、それをランダムな順でリスト化
  ///
  Future fetchWordsOfTheFlashcard() async {
    List<Word> words =
        await _wordRepository.findAll(flashcard: state.flashcard!);
    List<Word> shuffledWords = List.from(words);
    shuffledWords.shuffle(Random());
    state = state.copyWith(words: shuffledWords);
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
  /// stateのcurrentPageNumberを更新
  ///
  void updateCurrentPageNumber({required int index}) {
    // pageのindexは0始まりなので+1
    final currentPageNumber = index + 1;
    //　追加された無のページの際に更新が起きないための条件分岐
    if (currentPageNumber <= state.words.length) {
      state = state.copyWith(currentPageNumber: currentPageNumber);
    }
  }

  ///
  /// stateのtextSizeOptionの値を変更
  ///
  void changeFontSizeOfCard(TextSizeOption newTextSize) {
    state = state.copyWith(textSizeOption: newTextSize);
  }
}
