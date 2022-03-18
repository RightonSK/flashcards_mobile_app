import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_add_and_update_state.freezed.dart';

@freezed
class WordAddAndUpdateState with _$WordAddAndUpdateState {
  @JsonSerializable(explicitToJson: true)
  factory WordAddAndUpdateState({
    Flashcard? parentFlashcard,
    Word? word,
  }) = _WordAddAndUpdateState;
}
