import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_state.freezed.dart';

@freezed
class TopState with _$TopState {
  const TopState._();
  const factory TopState({
    @Default(<Flashcard>[]) List<Flashcard> flashcardList,
    Flashcard? selectedFlashcard,
    //@Default(false) bool appBarIsStacked,
    //@Default(false) bool isActionMode,
  }) = _TopState;

  bool get isActionMode => selectedFlashcard != null;
}
