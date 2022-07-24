import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_and_register_state.freezed.dart';

@freezed
class LoginAndRegisterState with _$LoginAndRegisterState {
  factory LoginAndRegisterState({
    @Default(true) bool isLoginMode,
    ////
    @Default(<Flashcard>[]) List<Flashcard> flashcardList,
    Flashcard? selectedFlashcard,
    @Default(false) bool appBarIsStacked,
    @Default(false) bool isActionMode,
  }) = _LoginAndRegisterState;
}
