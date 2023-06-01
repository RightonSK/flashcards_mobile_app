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

  ///
  /// 一つのflashcardに関連する全てのwordを取得
  ///
  Future<List<Word>> findAll({required Flashcard flashcard}) async {
    final wordsSnapshot = await _wordsRefWithConverter
        .where('flashcardId', isEqualTo: flashcard.id)
        .get();
    return wordsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  ///
  /// wordを新規で追加する
  ///
  Future add({required Word word}) async {
    await _wordsRefWithConverter.doc(word.id).set(word);
  }

  ///
  /// wordを更新
  ///
  Future update({required String uid, required Word word}) async {
    _wordsRefWithConverter.doc(word.id).set(word);
  }

  ///
  /// 単一又は複数のwordを削除
  ///
  Future delete({required List<String> wordIds}) async {
    for (final String wordId in wordIds) {
      final wordsSnapshot =
          await _wordsRefWithConverter.where('id', isEqualTo: wordId).get();
      if (wordsSnapshot.size == 1) {
        print('update in word repository: id = ${wordId}');
        print('update in word repository: size = ${wordsSnapshot.size}');
        await wordsSnapshot.docs[0].reference.delete();
      }
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
  /// あるuidに紐づくwordを全て削除 (アカウント削除用メソッド)
  ///
  Future<void> deleteAllByUID({required String uid}) async {
    final wordsSnapshot =
        await _wordsRefWithConverter.where('uid', isEqualTo: uid).get();
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
