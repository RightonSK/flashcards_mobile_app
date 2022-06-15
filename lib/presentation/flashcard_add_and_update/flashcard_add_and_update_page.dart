import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashCardAddAndUpdatePage extends ConsumerWidget {
  const FlashCardAddAndUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardAddAndUpdateState = ref.watch(flashcardAddAndUpdateProvider);
    final flashcardAddAndUpdateNotifier =
        ref.watch(flashcardAddAndUpdateProvider.notifier);
    final TextEditingController _titleController = TextEditingController();
    //詳細ページの初期化処理
    late final String _appBarTitle;
    late final String _buttonTitle;

    if (flashcardAddAndUpdateState.isUpdateMode) {
      _appBarTitle = '更新';
      _buttonTitle = '更新';
      _titleController.text = flashcardAddAndUpdateState.flashcard!.title;
    } else {
      _appBarTitle = '新規作成';
      _buttonTitle = '追加';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: <Widget>[
          Visibility(
            visible: flashcardAddAndUpdateState.isUpdateMode,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final result = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      return _DeleteCheckDialog(
                        flashcardTitle:
                            flashcardAddAndUpdateState.flashcard!.title,
                      );
                    });
                // YESを押された場合
                if (result != null && result == true) {
                  await flashcardAddAndUpdateNotifier.deleteFlashcard();
                  Navigator.pop(context);
                }
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
                await flashcardAddAndUpdateNotifier.addOrUpdateFlashcard(
                    title: _titleController.text);
                Navigator.pop(context);
              },
              child: Text(_buttonTitle)),
        ],
      ),
    );
  }
}

class _DeleteCheckDialog extends StatelessWidget {
  const _DeleteCheckDialog({required this.flashcardTitle, Key? key})
      : super(key: key);
  final String flashcardTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('確認'),
      content: Text('$flashcardTitleを削除しますか？'),
      actions: <Widget>[
        TextButton(
          child: const Text('NO'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text('YES'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
