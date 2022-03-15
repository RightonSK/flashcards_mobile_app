import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/presentation/custom_widgets/colored_status_bar.dart';
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

    return ColoredStatusBar(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('単語メモカード'),
        ),
        body: TopPageBody(topState: topState),
        //body: _createGridView(context, model),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FlashCardAddAndUpdatePage(),
              ),
            );
            //model.init();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TopPageBody extends ConsumerWidget {
  const TopPageBody({Key? key, required this.topState}) : super(key: key);
  final TopState topState;

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
                (Flashcard flashCard) => InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlashcardPage(),
                      ),
                    );
                    //model.init();
                  },
                  child: Card(
                    child: Center(
                      child: Text(flashCard.title),
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
