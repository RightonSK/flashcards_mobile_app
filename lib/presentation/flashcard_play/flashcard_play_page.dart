import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_play/flashcard_play_notifier.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_play/flashcard_play_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashcardPlayPage extends HookConsumerWidget {
  const FlashcardPlayPage({Key? key, required this.flashcard})
      : super(key: key);
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardPlayState = ref.watch(flashcardPlayProvider(flashcard));
    final flashcardPlayNotifier =
        ref.watch(flashcardPlayProvider(flashcard).notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colorBackground,
        foregroundColor: Colors.black,
        centerTitle: true,

        /// ページ数を表示
        title: Text(
          flashcardPlayState.currentPageNumber.toString() +
              '/' +
              flashcardPlayState.words.length.toString(),
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          // close iconを押されたら、top pageに戻る。
          onPressed: () async {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        actions: [
          PopupMenuButton<TextSizeOption>(
            icon: const Icon(Icons.format_size),
            //padding: EdgeInsets.only(right: 50),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: TextSizeOption.extraLarge,
                child: Text('特大'),
              ),
              const PopupMenuItem(
                value: TextSizeOption.large,
                child: Text('大')
              ),
              const PopupMenuItem(
                  value: TextSizeOption.medium,
                  child: Text('中')
              ),
              const PopupMenuItem(
                  value: TextSizeOption.small,
                  child: Text('小')
              ),
            ],
            onSelected: (value) async {
              switch (value) {
                case TextSizeOption.extraLarge:
                  flashcardPlayNotifier.changeFontSizeOfCard(TextSizeOption.extraLarge);
                  print(TextSizeOption.extraLarge.size);
                  break;
                case TextSizeOption.large:
                  flashcardPlayNotifier.changeFontSizeOfCard(TextSizeOption.large);
                  print(TextSizeOption.large.size);
                  break;
                case TextSizeOption.medium:
                  flashcardPlayNotifier.changeFontSizeOfCard(TextSizeOption.medium);
                  print(TextSizeOption.medium.size);
                  break;
                case TextSizeOption.small:
                  flashcardPlayNotifier.changeFontSizeOfCard(TextSizeOption.small);
                  print(TextSizeOption.small.size);
                  break;
                default:
                  print('not expected value');
                  break;
              }
            },
          ),
        ],
      ),
      body: _FlashcardPlayPageBody(
        flashcard: flashcard,
      ),
    );
  }
}

class _FlashcardPlayPageBody extends HookConsumerWidget {
  const _FlashcardPlayPageBody({required this.flashcard}) : super();
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardPlayState = ref.watch(flashcardPlayProvider(flashcard));
    final flashcardPlayNotifier =
        ref.watch(flashcardPlayProvider(flashcard).notifier);

    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: PageView(
        controller: flashcardPlayNotifier.pageController,
        //allowImplicitScrolling: true,
        onPageChanged: (index) {
          /// ページ番号を更新
          flashcardPlayNotifier.updateCurrentPageNumber(index: index);

          /// 最終単語を終えると,top pageへ
          if (index == flashcardPlayState.words.length) {
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            });
          }
        },
        children: (() {
          if (flashcardPlayState.words.isNotEmpty) {
            final pages = flashcardPlayState.words
                .map(
                  (Word word) => Center(
                    child: SizedBox(
                      width: 300,
                      height: 150,
                      child: InkWell(
                        onTap: () async {
                          flashcardPlayNotifier
                              .switchTheValueOfWordIdToIsFlipped(
                                  wordId: word.id);
                        },
                        child: Card(
                          child: LayoutBuilder(builder: (context, constraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraints.maxHeight),
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    flashcardPlayState
                                            .wordIdToIsFlipped[word.id]
                                        ? word.description
                                        : word.title,
                                    style: TextStyle(
                                      fontSize: flashcardPlayState.textSizeOption.size,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                )
                .toList();

            ///単語再生モード終了用に何もないpageを追加したListをreturn
            return [...pages, const SizedBox.shrink()];
          } else {
            return <SizedBox>[];
          }
        })(),
      ),
    );
  }
}

class CustomCard extends ConsumerWidget {
  CustomCard({Key? key}) : super(key: key);
  final List<String> wordList = ['a', 'b'];
  final flashcard = Flashcard(
      id: '',
      uid: '',
      title: '',
      isPinned: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardPlayNotifier =
        ref.watch(flashcardPlayProvider(flashcard).notifier);
    final flashcardPlayState = ref.watch(flashcardPlayProvider(flashcard));

    return Center(
      child: PageView.builder(
        itemCount: flashcardPlayState.words.length,
        itemBuilder: (context, index) {
          final word = flashcardPlayState.words[index];
          return Center(
            child: SizedBox(
              width: 300,
              height: 150,
              child: InkWell(
                onTap: () async {
                  flashcardPlayNotifier.switchTheValueOfWordIdToIsFlipped(
                      wordId: word.id);
                },
                child: Card(
                  child: Center(
                    child: Text(flashcardPlayState.wordIdToIsFlipped[word.id]
                        ? word.description
                        : word.title),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
