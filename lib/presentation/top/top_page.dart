import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/colored_status_bar.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/stacked_app_bar.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_notifier.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_page.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_notifier.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_page.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_play/flashcard_play_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/settings_page.dart';
import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// 画面遷移時にAction modeをoffにして、遷移。
///
Future pushPage(BuildContext context, WidgetRef ref, Widget page) async {
  ref.read(topProvider.notifier).falseActionMode();
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topState = ref.watch(topProvider);
    final topNotifier = ref.watch(topProvider.notifier);

    final defaultAppBar = AppBar(
      title: const Text('単語'),
      actions: [
        IconButton(
            onPressed: () async {
              await pushPage(context, ref, const SettingsPage());
            },
            icon: const Icon(Icons.settings)),
      ],
    );
    final contextualActionBar = AppBar(
      title: const Text('Action Bar'),
      backgroundColor: Colors.indigoAccent,
      leading: IconButton(
          onPressed: () {
            topNotifier.switchIsActionMode(isActionMode: false);
          },
          icon: const Icon(Icons.close)),
      actions: [
        IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (_) {
                  return AlertDialogSample(
                    flashcard: topState.selectedFlashcard!,
                    ref: ref,
                  );
                },
              );
            },
            icon: const Icon(Icons.play_arrow)),
        IconButton(
            onPressed: () async {
              // flashcardを渡し、isUpdateModeをtrue後、遷移
              if (topState.selectedFlashcard != null) {
                final flashcardAddAndUpdateState =
                    ref.read(flashcardAddAndUpdateProvider.notifier);
                flashcardAddAndUpdateState.passFlashcard(
                    flashcard: topState.selectedFlashcard!);
                flashcardAddAndUpdateState.switchIsUpdateMode(
                    isUpdateMode: true);
              } else {
                return;
              }
              await pushPage(context, ref, const FlashCardAddAndUpdatePage());
              // stateの初期化
              await topNotifier.init();
            },
            icon: const Icon(Icons.settings)),
      ],
    );

    return ColoredStatusBar(
      color: topState.appBarIsStacked
          ? Colors.indigoAccent
          : Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        //　単語帳やボタンを押された時以外、アクションモード終了
        onTap: () {
          topNotifier.falseActionMode();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: StackedAppBar(
              defaultAppBar: defaultAppBar,
              contextualActionBar: contextualActionBar,
              isStacked: topState.appBarIsStacked,
              child: const _TopPageBody(),
            ),
          ),
          //body: _createGridView(context, model),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await pushPage(context, ref, const FlashCardAddAndUpdatePage());
              // 追加処理後のstateの初期化
              await topNotifier.init();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class _TopPageBody extends ConsumerWidget {
  const _TopPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topState = ref.watch(topProvider);
    final topNotifier = ref.watch(topProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Text(
            'default:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          indent: 20,
          endIndent: 20,
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2.0,
          children: () {
            return topState.flashcardList.reversed
                .map(
                  (flashcard) => InkWell(
                    onTap: () async {
                      /// action modeの場合、同一のflashcardならaction modeをfalse
                      ///  そうではない場合、選択されたものをselectedFlashcardにセット。
                      if (topState.isActionMode) {
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          topNotifier.switchIsActionMode(isActionMode: false);
                        } else {
                          topNotifier.setSelectedFlashcard(
                              selectedFlashcard: flashcard);
                        }
                      } else {
                        await pushPage(
                            context, ref, FlashcardPage(flashcard: flashcard));
                        // stateの初期化
                        await topNotifier.init();
                      }
                    },
                    onLongPress: () {
                      // action modeの場合、selectedFlashcardならaction modeをfalse
                      // そうではない場合、選択されたものをselectedFlashcardにセット。
                      // action modeではない場合、action modeをtrueにして、selectedFlashcardをセット
                      if (topState.isActionMode) {
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          topNotifier.switchIsActionMode(isActionMode: false);
                        } else {
                          topNotifier.setSelectedFlashcard(
                              selectedFlashcard: flashcard);
                        }
                      } else {
                        topNotifier.switchIsActionMode(
                            isActionMode: true, selectedFlashcard: flashcard);
                      }
                    },
                    child: Card(
                      shape: () {
                        // flashcardのidがselectedFlashcardのidと同一なら枠の色を変更。
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          return const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.teal),
                          );
                        } else {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0));
                        }
                      }(),
                      child: Center(
                        child: Text(flashcard.title),
                      ),
                    ),
                  ),
                )
                .toList();
          }(),
        ),
      ],
    );
  }
}

class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample(
      {required this.flashcard, required this.ref, Key? key})
      : super(key: key);
  final Flashcard flashcard;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${flashcard.title}の再生ボタンが押されました。'),
      //content: Text('こうかいしませんね？'),
      actions: <Widget>[
        GestureDetector(
          child: Text('いいえ'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text('はい'),
          onTap: () {
            pushPage(context, ref, FlashcardPlayPage(flashcard: flashcard));
          },
        )
      ],
    );
  }
}
