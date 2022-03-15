import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashCardAddAndUpdatePage extends ConsumerWidget {
  const FlashCardAddAndUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardAddAndUpdateState = ref.watch(flashcardAddAndUpdateProvider);
    final flashcardAddAndUpdateNotifier =
        ref.watch(flashcardAddAndUpdateProvider.notifier);
    final TextEditingController _titleController =
        TextEditingController(text: flashcardAddAndUpdateState.flashcard.title);
    //詳細ページの初期化処理
    late final String _appBarTitle;
    late final String _buttonTitle;
    late final bool _isUpdatePage;
    if (flashcardAddAndUpdateState.mode == '1') {
      _appBarTitle = '新規作成';
      _buttonTitle = '追加';
      _isUpdatePage = false;
    } else if (flashcardAddAndUpdateState.mode == '2') {
      _appBarTitle = '更新';
      _buttonTitle = '更新';
      _isUpdatePage = true;
    } else {
      _appBarTitle = '新規作成';
      _buttonTitle = '追加';
      _isUpdatePage = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: <Widget>[
          Visibility(
            visible: _isUpdatePage,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                //await model.deleteFlashCard();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '単語カードタイトル',
                  hintText: '単語カードタイトル'),
              onChanged: (String title) {
                //model.changeTitle(title);
              },
              controller: _titleController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await flashcardAddAndUpdateNotifier.editFlashcard(
                    title: _titleController.text);
                Navigator.pop(context);
              },
              child: Text(_buttonTitle)),
        ],
      ),
    );
  }
}
