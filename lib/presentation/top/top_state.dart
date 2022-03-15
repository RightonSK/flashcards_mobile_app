import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_state.freezed.dart';

@freezed
class TopState with _$TopState {
  @JsonSerializable(explicitToJson: true)
  factory TopState({
    @Default(<Flashcard>[]) List<Flashcard> flashcardList,
  }) = _TopState;
}
