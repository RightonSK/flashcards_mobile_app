import 'package:flashcards_mobile_app/app_theme.dart';
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
import 'package:flashcards_mobile_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// 画面遷移時にAction modeをoffにして、遷移。
///
Future<void> _pushPage(
    {required BuildContext context,
    required WidgetRef ref,
    required bool fullScreenDialog,
    required Widget page}) async {
  ref.read(topProvider.notifier).turnOffActionMode();
  await NavigationUtil.pushPage(
      context: context, fullscreenDialog: fullScreenDialog, page: page);
}

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topState = ref.watch(topProvider);
    final topNotifier = ref.watch(topProvider.notifier);

    final defaultAppBar = AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              await _pushPage(
                  context: context,
                  ref: ref,
                  fullScreenDialog: false,
                  page: const SettingsPage());
            },
            icon: const Icon(Icons.settings)),
      ],
    );
    final contextualActionBar = AppBar(
      backgroundColor: AppColor.colorBackgroundOfContextualActionBar,
      foregroundColor: AppColor.colorForegroundOfContextualActionBar,
      leading: IconButton(
          onPressed: () {
            topNotifier.turnOffActionMode();
          },
          icon: const Icon(Icons.close)),
      actions: [
        IconButton(
            onPressed: () async {
              await _pushPage(
                  context: context,
                  ref: ref,
                  fullScreenDialog: false,
                  page: FlashcardPlayPage(
                      flashcard: topState.selectedFlashcard!));
            },
            icon: const Icon(Icons.play_arrow)),
        IconButton(
          onPressed: () async {
            await topNotifier.invertIsPinnedOfSelectedFlashcard();
            await topNotifier.init();
          },
          icon: () {
            if (topState.selectedFlashcard != null) {
              if (topState.selectedFlashcard!.isPinned) {
                return const Icon(
                  Icons.push_pin_outlined,
                  color: Colors.black, //
                );
              } else {
                return const Icon(
                  Icons.push_pin,
                  color: Colors.white, //
                );
              }
            } else {
              return const Icon(
                Icons.push_pin,
                color: Colors.white, //
              );
            }
          }(),
        ),
        IconButton(
          onPressed: () async {
            // Actionモードの時、flashcardAddAndUpdatePageに遷移
            if (topState.selectedFlashcard != null) {
              await _pushPage(
                  context: context,
                  ref: ref,
                  fullScreenDialog: false,
                  page: FlashCardAddAndUpdatePage(
                    flashcard: topState.selectedFlashcard!,
                  ));
              // stateの初期化
              await topNotifier.init();
            } else {
              return;
            }
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );

    return ColoredStatusBar(
      color: topState.isActionMode
          ? AppColor.colorActionModeOfStatusBar
          : AppColor.colorDefaultOfStatusBar,
      child: Scaffold(
        body: SingleChildScrollView(
          child: StackedAppBar(
            defaultAppBar: defaultAppBar,
            contextualActionBar: contextualActionBar,
            isStacked: topState.isActionMode,
            child: const _TopPageBody(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //flashcardAddAndUpdatePageに遷移
            await _pushPage(
                context: context,
                ref: ref,
                fullScreenDialog: true,
                page: const FlashCardAddAndUpdatePage(
                  flashcard: null,
                ));
            // 追加処理後のstateの初期化
            await topNotifier.init();
          },
          child: const Icon(Icons.add),
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
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
            '固定済み',
            style: TextStyle(
              fontSize: 14,
              //fontWeight: FontWeight.bold,
            ),
          ),
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
            return topState.pinnedFlashcardListSortedByUpdatedAt
                .map(
                  (flashcard) => InkWell(
                    onTap: () async {
                      /// action modeの場合、同一のflashcardならaction modeをfalse
                      ///  同一ではない場合、選択されたものをselectedFlashcardにセット。
                      ///  action modeではない場合、Flashcard pageに遷移
                      if (topState.isActionMode) {
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          topNotifier.turnOffActionMode();
                        } else {
                          topNotifier.setSelectedFlashcard(
                              selectedFlashcard: flashcard);
                        }
                      } else {
                        await _pushPage(
                            context: context,
                            ref: ref,
                            fullScreenDialog: false,
                            page: FlashcardPage(flashcard: flashcard));
                        // stateの初期化
                        await topNotifier.init();
                      }
                    },
                    onLongPress: () {
                      /// action modeの場合、selectedFlashcardならaction modeをfalse
                      /// そうではない場合、選択されたものをselectedFlashcardにセット。
                      /// action modeではない場合、action modeをtrueにして、selectedFlashcardをセット
                      if (topState.isActionMode) {
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          topNotifier.turnOffActionMode();
                        } else {
                          topNotifier.setSelectedFlashcard(
                              selectedFlashcard: flashcard);
                        }
                      } else {
                        topNotifier.setSelectedFlashcard(
                            selectedFlashcard: flashcard);
                        print(
                            'isActionMode is ${ref.read(topProvider).isActionMode}');
                      }
                    },
                    child: Card(
                      shape: () {
                        /// flashcardのidがselectedFlashcardのidと同一なら枠の色を変更。
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
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
                        child: Text(
                          flashcard.title,
                          style: TextThemeSettings.titleOfFlashcard,
                        ),
                      ),
                    ),
                  ),
                )
                .toList();
          }(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Text(
            'その他',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
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
            return topState.othersFlashcardListSortedByUpdatedAt
                .map(
                  (flashcard) => InkWell(
                    onTap: () async {
                      /// action modeの場合、同一のflashcardならaction modeをfalse
                      ///  同一ではない場合、選択されたものをselectedFlashcardにセット。
                      ///  action modeではない場合、Flashcard pageに遷移
                      if (topState.isActionMode) {
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          topNotifier.turnOffActionMode();
                        } else {
                          topNotifier.setSelectedFlashcard(
                              selectedFlashcard: flashcard);
                        }
                      } else {
                        await _pushPage(
                            context: context,
                            ref: ref,
                            fullScreenDialog: false,
                            page: FlashcardPage(flashcard: flashcard));
                        // stateの初期化
                        await topNotifier.init();
                      }
                    },
                    onLongPress: () {
                      /// action modeの場合、selectedFlashcardならaction modeをfalse
                      /// そうではない場合、選択されたものをselectedFlashcardにセット。
                      /// action modeではない場合、action modeをtrueにして、selectedFlashcardをセット
                      if (topState.isActionMode) {
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
                          topNotifier.turnOffActionMode();
                        } else {
                          topNotifier.setSelectedFlashcard(
                              selectedFlashcard: flashcard);
                        }
                      } else {
                        topNotifier.setSelectedFlashcard(
                            selectedFlashcard: flashcard);
                        print(
                            'isActionMode is ${ref.read(topProvider).isActionMode}');
                      }
                    },
                    child: Card(
                      shape: () {
                        /// flashcardのidがselectedFlashcardのidと同一なら枠の色を変更。
                        if (flashcard.id ==
                            (topState.selectedFlashcard?.id ?? -1)) {
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
                        child: Text(
                          flashcard.title,
                          style: TextThemeSettings.titleOfFlashcard,
                        ),
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
