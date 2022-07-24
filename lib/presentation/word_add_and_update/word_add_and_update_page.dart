import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordAddAndUpdatePage extends HookConsumerWidget {
  const WordAddAndUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordAddAndUpdateState = ref.watch(wordAddAndUpdateProvider);
    final wordAddAndUpdateNotifier =
        ref.watch(wordAddAndUpdateProvider.notifier);
    late final String _appBarTitle;
    late final String _buttonTitle;
    final TextEditingController _titleController = useTextEditingController();
    final TextEditingController _descriptionController =
        useTextEditingController();

    //詳細ページの初期化処理
    if (wordAddAndUpdateState.isUpdateMode) {
      _appBarTitle = '更新';
      _buttonTitle = '更新';
    } else {
      _appBarTitle = '新規作成';
      _buttonTitle = '追加';
    }

    useEffect(() {
      if (wordAddAndUpdateState.isUpdateMode) {
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
                          hintText: '単語名',
                        ),
                        onChanged: (String name) {
                          //model.changeWordName(name);
                        },
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
                          hintText: '意味',
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: null,
                        onChanged: (String description) {
                          //model.changeDescription(description);
                        },
                        controller: _descriptionController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    await wordAddAndUpdateNotifier.addOrUpdateWord(
                        title: _titleController.text,
                        description: _descriptionController.text);
                    Navigator.pop(context);
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
