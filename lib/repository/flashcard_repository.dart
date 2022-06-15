import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';

class FlashCaredRepository {
  final CollectionReference _flashcardsRef =
      FirebaseFirestore.instance.collection('flashcards');

  final _flashcardsRefWithConverter = FirebaseFirestore.instance
      .collection('flashcards')
      .withConverter<Flashcard>(
          fromFirestore: (snapshot, _) => Flashcard.fromJson(snapshot.data()!),
          toFirestore: (flashcard, _) => flashcard.toJson());

  ///
  /// flashcardを全て取得
  ///
  Future<List<Flashcard>> findAll() async {
    final flashcardsSnapshot = await _flashcardsRefWithConverter.get();
    return flashcardsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  ///
  /// flashcardを新規で追加する
  ///
  Future addFlashcard({required Flashcard flashCard}) async {
    await _flashcardsRefWithConverter.doc(flashCard.id).set(flashCard);
  }

  ///
  /// flashcardを更新
  ///
  Future updateFlashcard({required Flashcard flashcard}) async {
    await _flashcardsRef
        .doc(flashcard.id)
        .update({'title': flashcard.title, 'updatedAt': flashcard.updatedAt});
  }

  ///
  /// flashcardを削除
  ///
  Future deleteFlashcard({required String flashcardId}) async {
    await _flashcardsRef.doc(flashcardId).delete();
  }

  ///
  /// 新規で追加する際に新規のidを発行
  ///
  String getNewId() {
    return _flashcardsRef.doc().id;
  }
}
