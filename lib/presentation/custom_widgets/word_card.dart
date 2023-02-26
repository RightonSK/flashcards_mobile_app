import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_state.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  // FlashcardPage内のWordCard Widget
  const WordCard({Key? key, required Word word, required FlashcardState model})
      : _word = word,
        _model = model,
        super(key: key);

  final Word _word;
  final FlashcardState _model;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return InkWell(
    //   onTap: () async {
    //     if (_model.deleteMode) {
    //       //delete modeの場合、タップしたらその単語を選択状態にする
    //       _word.isSelected = !_word.isSelected;
    //       _model.reBuild();
    //     } else {
    //       // delete modeではない場合、その単語の意味pageを表示
    //       await Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => WordDescriptionPage(word: _word),
    //         ),
    //       );
    //       _model.init();
    //     }
    //   },
    //   onLongPress: () async {
    //     // long pressされた場合は、その単語のisSelectedプロパティのtrue false反転させ
    //     //　再描画を行う
    //     _word.isSelected = !_word.isSelected;
    //     _model.reBuild();
    //   },
    //   child: Card(
    //     shape: () {
    //       // delete modeかつselected状態なら枠の色を変更。
    //       if (_model.deleteMode && _word.isSelected) {
    //         return const RoundedRectangleBorder(
    //           side: BorderSide(color: Colors.teal),
    //         );
    //       } else {
    //         return RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(4.0));
    //       }
    //     }(),
    //     child: Center(
    //       child: Text(_word.name),
    //     ),
    //   ),
    // );
  }
}
