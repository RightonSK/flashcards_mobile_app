import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_state.freezed.dart';

@freezed
class TopState with _$TopState {
  const TopState._();

  const factory TopState({
    @Default(<Flashcard>[]) List<Flashcard> flashcardList,
    Flashcard? selectedFlashcard,
  }) = _TopState;

  bool get isActionMode => selectedFlashcard != null;
  // 年代降順でソートしたpinnedFlashcardListを返す
  List<Flashcard> get pinnedFlashcardListSortedByUpdatedAt {
    final pinnedFlashcardList =
        flashcardList.where((flashcard) => flashcard.isPinned == true).toList();
    pinnedFlashcardList.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return pinnedFlashcardList;
  }

  // 年代降順でソートしたotherFlashcardListを返す
  List<Flashcard> get othersFlashcardListSortedByUpdatedAt {
    final othersFlashcardList = flashcardList
        .where((flashcard) => flashcard.isPinned == false)
        .toList();
    othersFlashcardList.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return othersFlashcardList;
  }
}
