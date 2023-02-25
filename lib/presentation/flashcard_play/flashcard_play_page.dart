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
                onPressed: () {
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
    //final PageController controller = PageController();
    final PageController controller = usePageController();

    // useEffect(() {
    //   final PageController controller = PageController();
    // }, const []);

    //flashcardPlayNotifier.

    return Theme(
      data: Theme.of(context).copyWith(
          //cardTheme: null,
          ),
      child: PageView(
          controller: controller,
          children: flashcardPlayState.words.isNotEmpty
              ? flashcardPlayState.words
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
                            shape: () {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }(),
                            child: Center(
                              child: Text(
                                  flashcardPlayState.wordIdToIsFlipped[word.id]
                                      ? word.description
                                      : word.title),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
              : <SizedBox>[]),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
