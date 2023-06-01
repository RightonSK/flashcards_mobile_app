import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_state.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordAddAndUpdateProvider = StateNotifierProvider.autoDispose
    .family<WordAddAndUpdateNotifier, WordAddAndUpdateState, Word?>(
        (ref, Word? word) =>
            WordAddAndUpdateNotifier(ref, WordAddAndUpdateState(), word));

class WordAddAndUpdateNotifier extends StateNotifier<WordAddAndUpdateState> {
  WordAddAndUpdateNotifier(this._ref, WordAddAndUpdateState state, Word? word)
      : super(state) {
    // 更新モードの場合、wordをstateに渡す。
    if (word != null) {
      passWord(word: word);
    }
  }

  final _wordRepository = WordRepository();
  final _flashcardRepository = FlashcardRepository();
  final Ref _ref;

  // wordをstateに渡すためのメソッド
  void passWord({required Word word}) {
    state = state.copyWith(word: word);
  }

  ///
  /// 追加または、更新されたwordをrepositoryに渡す
  ///
  Future addOrUpdateWord(
      {required String title,
      required String description,
      required String flashcardId,
      required bool isUpdateMode}) async {
    if (title.isEmpty) {
      throw const FormatException('単語名を入力して下さい');
    }
    if (description.isEmpty) {
      throw const FormatException('意味を入力して下さい');
    }
    final user = _ref.read(userProvider);
    final Word word;
    if (isUpdateMode) {
      word = state.word!.copyWith(
          title: title, description: description, updatedAt: DateTime.now());
    } else {
      final String newId = _wordRepository.getNewId();
      word = Word(
          id: newId,
          flashcardId: flashcardId,
          uid: user!.uid,
          title: title,
          description: description,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
    }
    state = state.copyWith(word: word);
    // add or update分岐
    if (isUpdateMode) {
      await _wordRepository.update(uid: user!.uid, word: state.word!);
    } else {
      await _wordRepository.add(word: state.word!);
    }
    // 親FlashcardのupdatedAtを更新
    if (state.word != null) {
      await _flashcardRepository.updateUpdatedAt(
          flashcardId: state.word!.flashcardId);
    }
  }
}
