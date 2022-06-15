import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';

class WordRepository {
  final _wordsRef = FirebaseFirestore.instance.collection('words');
  final _wordsRefWithConverter = FirebaseFirestore.instance
      .collection('words')
      .withConverter<Word>(
          fromFirestore: (snapshot, _) => Word.fromJson(snapshot.data()!),
          toFirestore: (word, _) => word.toJson());

  Future<List<Word>> findAll(Flashcard flashcard) async {
    final wordsSnapshot = await _wordsRefWithConverter
        .where('flashcardId', isEqualTo: flashcard.id)
        .get();
    return wordsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future addUpdate({required Word word}) async {
    await _wordsRefWithConverter.doc(word.id).set(word);
  }

  ///
  /// wordを削除
  ///
  Future delete({required List<String> wordIds}) async {
    for (final String wordId in wordIds) {
      await _wordsRef.doc(wordId).delete();
    }
  }

  ///
  /// Flashcardの全てのwordを削除
  ///
  Future deleteAll({required String flashcardId}) async {
    final wordsSnapshot = await _wordsRefWithConverter
        .where('flashcardId', isEqualTo: flashcardId)
        .get();
    for (QueryDocumentSnapshot doc in wordsSnapshot.docs) {
      await doc.reference.delete();
    }
  }

  ///
  /// 新規で追加する際に新規のidを発行
  ///
  String getNewId() {
    return _wordsRef.doc().id;
  }
}
