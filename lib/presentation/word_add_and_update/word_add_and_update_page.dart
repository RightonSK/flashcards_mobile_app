import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_notifier.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///追加モードの時は、wordWillUpdate引数はnullを渡し、更新モードの際は、wordWillUpdateを渡す。
class WordAddAndUpdatePage extends HookConsumerWidget {
  const WordAddAndUpdatePage(
      {Key? key,
      //required this.isUpdateMode,
      required this.wordWillUpdate,
      required this.flashcardId})
      : super(key: key);
  //final bool isUpdateMode;
  final Word? wordWillUpdate;
  final String flashcardId;

  bool get isUpdateMode => wordWillUpdate != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordAddAndUpdateState =
        ref.watch(wordAddAndUpdateProvider(wordWillUpdate));
    final wordAddAndUpdateNotifier =
        ref.watch(wordAddAndUpdateProvider(wordWillUpdate).notifier);
    late final String _appBarTitle;
    late final String _buttonTitle;
    final TextEditingController _titleController = useTextEditingController();
    final TextEditingController _descriptionController =
        useTextEditingController();

    //詳細ページの初期化処理
    if (isUpdateMode) {
      _appBarTitle = '更新';
      _buttonTitle = '更新';
    } else {
      _appBarTitle = '新規作成';
      _buttonTitle = '追加';
    }

    useEffect(() {
      if (isUpdateMode) {
        _titleController.text = wordAddAndUpdateState.word!.title;
        _descriptionController.text = wordAddAndUpdateState.word!.description;
      }
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              Container(
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
                          labelText: '単語名',
                          hintText: '単語名を入力して下さい',
                        ),
                        controller: _titleController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  //vertical: 8,
                ),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.description,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '意味',
                          hintText: '単語の意味を入力して下さい',
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: null,
                        controller: _descriptionController,
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
                      await wordAddAndUpdateNotifier.addOrUpdateWord(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          flashcardId: flashcardId,
                          isUpdateMode: isUpdateMode);
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
