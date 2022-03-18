import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/colored_status_bar.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_notifier.dart';
import 'package:flashcards_mobile_app/presentation/flashcard/flashcard_page.dart';
import 'package:flashcards_mobile_app/presentation/flashcard_add_and_update/flashcard_add_and_update_page.dart';
import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topState = ref.watch(topProvider);
    final topNotifier = ref.watch(topProvider.notifier);

    return ColoredStatusBar(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('単語メモカード'),
        ),
        body: TopPageBody(
          topState: topState,
          topNotifier: topNotifier,
        ),
        //body: _createGridView(context, model),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FlashCardAddAndUpdatePage(),
              ),
            );
            // flashcardsを更新
            await topNotifier.fetchFlashcardList();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TopPageBody extends ConsumerWidget {
  const TopPageBody(
      {Key? key, required this.topState, required this.topNotifier})
      : super(key: key);
  final TopState topState;
  final TopNotifier topNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          children: topState.flashcardList
              .map(
                (Flashcard flashcard) => InkWell(
                  onTap: () async {
                    // flashcard pageのstateにflashcardを渡し、その後flashcardが
                    // nullじゃないならページ遷移
                    await ref
                        .read(flashcardProvider.notifier)
                        .init(flashcard: flashcard);
                    if (ref.read(flashcardProvider).flashcard != null) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FlashcardPage(),
                        ),
                      );
                    }
                    // flashcardsを更新
                    //await topNotifier.fetchFlashcardList();
                  },
                  child: Card(
                    child: Center(
                      child: Text(flashcard.title),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
