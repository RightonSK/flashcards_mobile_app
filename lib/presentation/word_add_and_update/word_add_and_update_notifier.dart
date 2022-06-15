import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordAddAndUpdateProvider =
    StateNotifierProvider<WordAddAndUpdateNotifier, WordAddAndUpdateState>(
        (ref) => WordAddAndUpdateNotifier(WordAddAndUpdateState()));

class WordAddAndUpdateNotifier extends StateNotifier<WordAddAndUpdateState> {
  WordAddAndUpdateNotifier(WordAddAndUpdateState state) : super(state);
  final _wordRepository = WordRepository();

  // flashcardを渡し、stateに保存
  void passFlashcard({required Flashcard flashcard}) async {
    state = state.copyWith(parentFlashcard: flashcard);
  }

  // wordをstateに渡すためのメソッド
  void passWord({required Word word}) {
    state = state.copyWith(word: word);
  }

  // isUpdateModeのbool値を変更
  void switchIsUpdateMode({required bool isUpdateMode}) {
    state = state.copyWith(isUpdateMode: isUpdateMode);
  }

  ///
  /// 追加または、更新されたwordをrepositoryに渡す
  ///
  Future addOrUpdateWord(
      {required String title, required String description}) async {
    late final Word word;
    if (state.isUpdateMode) {
      word = state.word!.copyWith(
          title: title, description: description, updatedAt: DateTime.now());
    } else {
      final String newId = _wordRepository.getNewId();
      word = Word(
          id: newId,
          flashcardId: state.parentFlashcard!.id,
          title: title,
          description: description,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    }
    await _wordRepository.addUpdate(word: word);
  }
}
