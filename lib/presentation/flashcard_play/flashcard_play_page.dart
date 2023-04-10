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
      body: SafeArea(
        child: Stack(
          children: [
            _FlashcardPlayPageBody(
              flashcard: flashcard,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.close),
                // close iconを押されたら、top pageに戻る。
                onPressed: () async {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
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
    final PageController pageController = usePageController();

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
        controller: pageController,
        allowImplicitScrolling: false,
        onPageChanged: (index) {
          /// 最終単語を終えると,Navigate
          print(index);
          if (flashcardPlayState.words.isNotEmpty) {
            if (index == flashcardPlayState.words.length) {
              print('navigate');
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              });
            }
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
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Text(
                              flashcardPlayState.wordIdToIsFlipped[word.id]
                                  ? word.description
                                  : word.title,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList();

            ///単語再生モード終了用にWidgetを追加したListをreturn
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

// class Sample extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Center(
//       child: PageView(
//         controller: pageController,
//         allowImplicitScrolling: false,
//         onPageChanged: (index) {
//           /// 最終単語を終えると,Navigate
//           print(index);
//           if (flashcardPlayState.words.isNotEmpty) {
//             if (index == flashcardPlayState.words.length) {
//               print('navigate');
//               Future.delayed(const Duration(seconds: 1), () {
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//               });
//             }
//           }
//         },
//         children: (() {
//           if (flashcardPlayState.words.isNotEmpty) {
//             final pages = flashcardPlayState.words
//                 .map(
//                   (Word word) => Center(
//                     child: SizedBox(
//                       width: 300,
//                       height: 150,
//                       child: InkWell(
//                         onTap: () async {
//                           flashcardPlayNotifier
//                               .switchTheValueOfWordIdToIsFlipped(
//                                   wordId: word.id);
//                         },
//                         child: Card(
//                           child: Center(
//                             child: Text(
//                                 flashcardPlayState.wordIdToIsFlipped[word.id]
//                                     ? word.description
//                                     : word.title),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList();
//
//             ///単語再生モード終了用にWidgetを追加したListをreturn
//             return [...pages, const SizedBox.shrink()];
//           } else {
//             return <SizedBox>[];
//           }
//         })(),
//       ),
//     );
//   }
// }
