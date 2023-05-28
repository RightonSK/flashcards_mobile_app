import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/colored_status_bar.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/stacked_app_bar.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_notifier.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_state.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_page.dart';
import 'package:flashcards_mobile_app/utils/navigation_util.dart';
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
      backgroundColor: AppColor.colorBackgroundOfContextualActionBar,
      leading: IconButton(
          onPressed: () {
            //flashcardNotifier.switchIsActionMode(isActionMode: false);
            flashcardNotifier.turnOffActionMode();
          },
          icon: const Icon(Icons.close)),
      actions: [
        ///　設定アイコン
        /// 選択されたwordが1の場合
        if (flashcardState.wordIdToSelectedWord.length == 1)
          IconButton(
            onPressed: () async {
              //選択されたwordを抜き出す
              final wordList = flashcardState.wordIdToSelectedWord.entries
                  .map((e) => e.value)
                  .toList();
              final Word word = wordList[0];
              //遷移
              await NavigationUtil.pushPage(
                  context: context,
                  fullscreenDialog: false,
                  page: WordAddAndUpdatePage(
                    wordWillUpdate: word,
                    flashcardId: flashcardState.flashcard!.id,
                  ));
              // wordsを再取得し更新、isActionModeをfalseにする。
              await flashcardNotifier.updateWords();
              flashcardNotifier.turnOffActionMode();
              //flashcardNotifier.switchIsActionMode(isActionMode: false);
            },
            icon: const Icon(Icons.settings),
          )

        /// 選択されたword2個以上の場合
        else
          PopupMenuButton<Word>(
            // Callback that sets the selected popup menu item.
            onSelected: (Word word) async {
              // ActionMode終了後、選択されたwordの更新画面に遷移
              flashcardNotifier.turnOffActionMode();
              await NavigationUtil.pushPage(
                context: context,
                fullscreenDialog: false,
                page: WordAddAndUpdatePage(
                  wordWillUpdate: word,
                  flashcardId: flashcardState.flashcard!.id,
                ),
              );
              // wordsを再取得。
              await flashcardNotifier.updateWords();
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
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          //padding: EdgeInsets.only(right: 50),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: '削除',
              child: Text("削除"),
            ),
          ],
          onSelected: (value) async {
            if (value == '削除') {
              await flashcardNotifier.deleteWords();
              // wordsを再取得、プロパティの初期化
              await flashcardNotifier.updateWords();
              flashcardNotifier.turnOffActionMode();
            } else {
              print('not expected value');
            }
          },
        ),
      ],
    );

    return ColoredStatusBar(
      color: flashcardState.isActionMode
          ? AppColor.colorActionModeOfStatusBar
          : AppColor.colorDefaultOfStatusBar,
      child: Scaffold(
        body: StackedAppBar(
          defaultAppBar: defaultAppBar,
          contextualActionBar: contextualActionBar,
          isStacked: flashcardState.isActionMode,
          child: Expanded(
            child: SingleChildScrollView(
              child: _FlashcardPageBody(
                flashcard: flashcard,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // action modeを終了し、遷移
            flashcardNotifier.turnOffActionMode();
            await NavigationUtil.pushPage(
              context: context,
              fullscreenDialog: true,
              page: WordAddAndUpdatePage(
                wordWillUpdate: null,
                flashcardId: flashcardState.flashcard!.id,
              ),
            );
            // wordsを再取得
            await flashcardNotifier.updateWords();
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
                      //要素が0かどうか確認して、空ならaction modeを終了
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
                          side: BorderSide(
                              color: AppColor.colorBorderOfSelectedCard),
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
