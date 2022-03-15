import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashcardPage extends ConsumerWidget {
  const FlashcardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(model.flashCard.title),
  //     ),
  //     body: GridView.count(
  //       padding: const EdgeInsets.all(20),
  //       crossAxisSpacing: 10,
  //       mainAxisSpacing: 10,
  //       crossAxisCount: 2,
  //       childAspectRatio: 2.0,
  //       children: model.words != null
  //           ? model.words
  //           .map(
  //             (Word word) => WordCard(word: word, model: model),
  //       )
  //           .toList()
  //           : <SizedBox>[],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () async {
  //         await Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => WordAddPage(
  //               flashCard: model.flashCard,
  //             ),
  //           ),
  //         );
  //         model.init();
  //       },
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
}
