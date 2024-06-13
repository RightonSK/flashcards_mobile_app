import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///追加モードの時は、flashcard引数はnullを渡し、更新モードの際は、flashcardを渡す。
class FlashcardAddAndUpdatePage extends HookConsumerWidget {
  const FlashcardAddAndUpdatePage({Key? key, required this.flashcard})
      : super(key: key);

  //final bool isUpdateMode;
  final Flashcard? flashcard;

  bool get isUpdateMode => flashcard != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardAddAndUpdateState =
        ref.watch(flashcardAddAndUpdateProvider(flashcard));
    final flashcardAddAndUpdateNotifier =
        ref.watch(flashcardAddAndUpdateProvider(flashcard).notifier);
    final TextEditingController _titleController = useTextEditingController();
    //詳細ページの初期化処理
    late final String _appBarTitle;
    late final String _buttonTitle;

    if (isUpdateMode) {
      _appBarTitle = '更新';
      _buttonTitle = '更新';
    } else {
      _appBarTitle = '新規作成';
      _buttonTitle = '追加';
    }

    useEffect(() {
      if (isUpdateMode) {
        _titleController.text = flashcardAddAndUpdateState.flashcard!.title;
      }
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: <Widget>[
          Visibility(
            visible: isUpdateMode,
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
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.create,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '単語カード名',
                          hintText: '単語カード名を入力して下さい',
                        ),
                        controller: _titleController,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await flashcardAddAndUpdateNotifier.addOrUpdateFlashcard(
                        title: _titleController.text,
                        isUpdateMode: isUpdateMode,
                      );
                      Navigator.pop(context);
                    } on FormatException catch (e) {
                      NotificationUtil.showTextDialog(
                          context: context, message: e.message);
                    } catch (e) {
                      NotificationUtil.showTextSnackBar(
                          context: context,
                          message:
                              ConvertToErrorMessageUtil.convertErrorMessage(
                                  ''));
                    }
                  },
                  child: Text(_buttonTitle),
                ),
              ),
            ],
          ),
        ),
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
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text('YES'),
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
