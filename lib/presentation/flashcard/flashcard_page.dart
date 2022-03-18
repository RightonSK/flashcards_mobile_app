import 'package:flashcards_mobile_app/domain/word.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_notifier.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_notifier.dart';
import 'package:flashcards_mobile_app/presentation/word_add_and_update/word_add_and_update_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashcardPage extends ConsumerWidget {
  const FlashcardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardState = ref.watch(flashcardProvider);
    final flashcardNotifier = ref.watch(flashcardProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(flashcardState.flashcard!.title),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 2.0,
        children: flashcardState.words.isNotEmpty
            ? flashcardState.words
                .map(
                  (Word word) => Material(
                    elevation: 2.0,
                    child: ListTile(
                      title: Center(child: Text(word.name)),
                      tileColor: Colors.white,
                    ),
                  ),
                )
                .toList()
            : <SizedBox>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // word add and update pageのstateにflashcardを渡し、その後flashcardが
          // nullじゃないならページ遷移
          await ref
              .read(wordAddAndUpdateProvider.notifier)
              .passFlashcard(flashcard: flashcardState.flashcard!);
          if (ref.read(wordAddAndUpdateProvider).parentFlashcard != null) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WordAddAndUpdatePage(),
              ),
            );
          }
          // wordsを更新
          await flashcardNotifier.updateWords();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
