import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/colored_status_bar.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/stacked_app_bar.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_notifier.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_state.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashcardPage extends ConsumerWidget {
  const FlashcardPage({Key? key, required this.flashcard}) : super(key: key);
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardState = ref.watch(flashcardProvider(flashcard));
    final flashcardNotifier = ref.watch(flashcardProvider(flashcard).notifier);

    final defaultAppBar = AppBar(
      title: Text(flashcardState.flashcard!.title),
    );
    final contextualActionBar = AppBar(
      title: Text('${flashcardState.wordIdToSelectedWord.length}'),
      titleSpacing: 0,
      centerTitle: false,
      backgroundColor: AppColor.colorOfContextualActionBar,
      leading: IconButton(
          onPressed: () {
            //flashcardNotifier.switchIsActionMode(isActionMode: false);
            flashcardNotifier.turnOffActionMode();
          },
          icon: const Icon(Icons.close)),
      actions: [
        // deleteボタン
        IconButton(
            onPressed: () async {
              final result = await showDialog<bool>(
                context: context,
                builder: (_) {
                  return _DeleteCheckDialog(
                      theNumberOfSelectedWords: flashcardState
                          .wordIdToSelectedWord.length
                          .toString());
                },
              );
              // YESの場合
              if (result != null && result == true) {
                await flashcardNotifier.deleteWords();
              } else {
                // 選択されていない場合、またはNOの場合
                return;
              }
              // wordsを再取得、プロパティの初期化
              await flashcardNotifier.updateWords();
              flashcardNotifier.turnOffActionMode();
              //flashcardNotifier.switchIsActionMode(isActionMode: false);
            },
            icon: const Icon(Icons.delete)),
        // 選択されたwordが1の場合、setting page
        if (flashcardState.wordIdToSelectedWord.length == 1)
          IconButton(
            onPressed: () async {
              final wordList = flashcardState.wordIdToSelectedWord.entries
                  .map((e) => e.value)
                  .toList();
              final Word word = wordList[0];

              // final wordAddAndUpdatePageNotifier =
              //     ref.read(wordAddAndUpdateProvider.notifier);
              // // 遷移先のstateにwordを渡し、そのisUpdateModeをtrueにする。
              // wordAddAndUpdatePageNotifier.passWord(word: word);
              // wordAddAndUpdatePageNotifier.switchIsUpdateMode(
              //     isUpdateMode: true);
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordAddAndUpdatePage(
                      wordWillUpdate: word,
                      flashcardId: flashcardState.flashcard!.id,
                    ),
                  ));
              // wordsを再取得し更新、isActionModeをfalseにする。
              await flashcardNotifier.updateWords();
              flashcardNotifier.turnOffActionMode();
              //flashcardNotifier.switchIsActionMode(isActionMode: false);
            },
            icon: const Icon(Icons.settings),
          )
        // 選択されたword2個以上の時のsetting page
        else
          PopupMenuButton<Word>(
            // Callback that sets the selected popup menu item.
            onSelected: (Word word) async {
              // 遷移先のstateにwordを渡し、そのisUpdateModeをtrueにする。
              // final wordAddAndUpdatePageNotifier =
              //     ref.read(wordAddAndUpdateProvider.notifier);
              // wordAddAndUpdatePageNotifier.passWord(word: word);
              // wordAddAndUpdatePageNotifier.switchIsUpdateMode(
              //     isUpdateMode: true);

              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordAddAndUpdatePage(
                      wordWillUpdate: word,
                      flashcardId: flashcardState.flashcard!.id,
                    ),
                  ));
              // wordsを再取得し更新、isActionModeをfalseにする。
              await flashcardNotifier.updateWords();
              flashcardNotifier.turnOffActionMode();
              //flashcardNotifier.switchIsActionMode(isActionMode: false);
            },
            icon: const Icon(Icons.settings),
            itemBuilder: (BuildContext context) =>
                flashcardState.wordIdToSelectedWord.entries
                    .map((e) => PopupMenuItem<Word>(
                          child: Text(e.value.title),
                          value: e.value,
                        ))
                    .toList(),
          ),
      ],
    );

    return ColoredStatusBar(
      color: flashcardState.isActionMode
          ? AppColor.colorOfActionModeOfStatusBar
          : AppColor.colorOfDefaultOfStatusBar,
      child: Scaffold(
        body: StackedAppBar(
          defaultAppBar: defaultAppBar,
          contextualActionBar: contextualActionBar,
          isStacked: flashcardState.isActionMode,
          child: _FlashcardPageBody(
            flashcard: flashcard,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // word add and update pageのstateにflashcardを渡し、isUpdateModeをfalse
            // その後flashcardがnullじゃないならページ遷移

            // final wordAddAndUpdateNotifier =
            //     ref.read(wordAddAndUpdateProvider.notifier);
            // wordAddAndUpdateNotifier.switchIsUpdateMode(isUpdateMode: false);
            // if (ref.read(wordAddAndUpdateProvider).parentFlashcard != null) {
            //   await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const WordAddAndUpdatePage(),
            //     ),
            //   );
            // }
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordAddAndUpdatePage(
                  wordWillUpdate: null,
                  flashcardId: flashcardState.flashcard!.id,
                ),
              ),
            );
            // wordsを再取得し更新、isActionModeをfalseにする。
            await flashcardNotifier.updateWords();
            flashcardNotifier.turnOffActionMode();
            //flashcardNotifier.switchIsActionMode(isActionMode: false);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _FlashcardPageBody extends ConsumerWidget {
  const _FlashcardPageBody({Key? key, required this.flashcard})
      : super(key: key);
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardState = ref.watch(flashcardProvider(flashcard));
    final flashcardNotifier = ref.watch(flashcardProvider(flashcard).notifier);

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 2.0,
      children: flashcardState.words.isNotEmpty
          ? flashcardState.words
              .map(
                (Word word) => InkWell(
                  onTap: () async {
                    // action modeの場合、selectedWordならMapからそのWordを削除
                    // そうではない場合,そのWordをMapに追加。
                    // action modeではない場合、wordIdToIsFlippedのvalue(bool値)を変更
                    if (flashcardState.isActionMode) {
                      if (flashcardState.wordIdToSelectedWord
                          .containsKey(word.id)) {
                        flashcardNotifier.deleteWordFromWordIdToSelectedWord(
                            selectedWord: word);
                      } else {
                        flashcardNotifier.addWordToWordIdToSelectedWord(
                            selectedWord: word);
                      }
                      //要素が0かどうか確認
                      flashcardNotifier.checkIfWordIdToSelectedWordIsEmpty();
                    } else {
                      flashcardNotifier.switchTheValueOfWordIdToIsFlipped(
                          wordId: word.id);
                    }
                  },
                  onLongPress: () {
                    // action modeの場合、selectedWordならMapからそのWordを削除
                    // そうではない場合,そのWordをMapに追加。
                    // action modeではない場合、action modeをtrueにして、selectedWordをMapに追加
                    if (flashcardState.isActionMode) {
                      if (flashcardState.wordIdToSelectedWord
                          .containsKey(word.id)) {
                        flashcardNotifier.deleteWordFromWordIdToSelectedWord(
                            selectedWord: word);
                      } else {
                        flashcardNotifier.addWordToWordIdToSelectedWord(
                            selectedWord: word);
                      }
                      //要素が0かどうか確認して、空ならAction Modeを終了
                      if (flashcardNotifier
                          .checkIfWordIdToSelectedWordIsEmpty()) {
                        flashcardNotifier.turnOffActionMode();
                      }
                    } else {
                      flashcardNotifier.turnOnActionMode(selectedWord: word);
                      // flashcardNotifier.switchIsActionMode(
                      //     isActionMode: true, selectedWord: word);
                    }
                  },
                  child: Card(
                    shape: () {
                      // wordIdToSelectedWordがこのwordのidを持っているならば、枠の色を変更。
                      if (flashcardState.wordIdToSelectedWord
                          .containsKey(word.id)) {
                        return const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.teal),
                        );
                      } else {
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0));
                      }
                    }(),
                    child: Center(
                      child: Text(flashcardState.wordIdToIsFlipped[word.id]
                          ? word.description
                          : word.title),
                    ),
                  ),
                ),
              )
              .toList()
          : <SizedBox>[],
    );
  }
}

class _DeleteCheckDialog extends StatelessWidget {
  const _DeleteCheckDialog({required this.theNumberOfSelectedWords, Key? key})
      : super(key: key);
  final String theNumberOfSelectedWords;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('確認'),
      content: Text('$theNumberOfSelectedWordsつの単語を削除しますか？'),
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
