import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashcardRepository {
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
  Future<List<Flashcard>> findAll({required String uid}) async {
    final flashcardsSnapshot =
        await _flashcardsRefWithConverter.where('uid', isEqualTo: uid).get();
    return flashcardsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  ///
  /// flashcardを新規で追加する
  ///
  Future add({required Flashcard flashcard}) async {
    await _flashcardsRefWithConverter.doc(flashcard.id).set(flashcard);
  }

  ///
  /// flashcardを更新
  ///
  Future update({required Flashcard flashcard}) async {
    await _flashcardsRefWithConverter.doc(flashcard.id).set(flashcard);
  }

  ///
  /// flashcardのupdatedAtプロパティを更新
  ///
  Future updateUpdatedAt({required String flashcardId}) async {
    await _flashcardsRef.doc(flashcardId).update({'updatedAt': DateTime.now()});
  }

  ///
  /// flashcardを削除
  ///
  Future delete({required String flashcardId}) async {
    await _flashcardsRefWithConverter.doc(flashcardId).delete();
  }

  ///
  /// あるuidに関する全てのflashcardを削除
  ///
  Future<void> deleteAllByUID({required String uid}) async {
    final flashcardSnapshot =
        await _flashcardsRefWithConverter.where('uid', isEqualTo: uid).get();
    for (QueryDocumentSnapshot doc in flashcardSnapshot.docs) {
      await doc.reference.delete();
    }
  }

  ///
  /// flashcardのisPinnedを反転
  ///
  Future<void> invertIsPinned({required Flashcard flashcard}) async {
    await _flashcardsRef
        .doc(flashcard.id)
        .update({'isPinned': flashcard.isPinned});
  }

  ///
  /// 新規で追加する際に新規のidを発行
  ///
  String getNewId() {
    return _flashcardsRef.doc().id;
  }
}
