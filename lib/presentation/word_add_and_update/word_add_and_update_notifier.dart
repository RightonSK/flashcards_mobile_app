import 'package:flashcards_mobile_app/app_model.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordAddAndUpdateProvider =
    StateNotifierProvider<WordAddAndUpdateNotifier, WordAddAndUpdateState>(
        (ref) => WordAddAndUpdateNotifier(ref, WordAddAndUpdateState()));

class WordAddAndUpdateNotifier extends StateNotifier<WordAddAndUpdateState> {
  WordAddAndUpdateNotifier(this._ref, WordAddAndUpdateState state)
      : super(state);
  final _wordRepository = WordRepository();
  final Ref _ref;

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
    final user = _ref.read(userProvider);
    final Word word;
    if (state.isUpdateMode) {
      word = state.word!.copyWith(
          title: title, description: description, updatedAt: DateTime.now());
    } else {
      final String newId = _wordRepository.getNewId();
      word = Word(
          id: newId,
          flashcardId: state.parentFlashcard!.id,
          uid: user!.uid,
          title: title,
          description: description,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    }
    state = state.copyWith(word: word);
    // add or update分岐
    if (state.isUpdateMode) {
      await _wordRepository.update(uid: user!.uid, word: state.word!);
    } else {
      await _wordRepository.add(word: state.word!);
    }
  }
}
