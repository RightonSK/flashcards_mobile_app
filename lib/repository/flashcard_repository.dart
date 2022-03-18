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

  Future<List<Flashcard>> fetchAllFlashcards() async {
    final flashcardsSnapshot = await _flashcardsRefWithConverter.get();
    return flashcardsSnapshot.docs.map((doc) => doc.data()).toList();

    // final flashcardsSnapshot = await _flashcardsRef.get();
    // print('fetch');
    // return flashcardsSnapshot.docs
    //     .map(
    //       (doc) => Flashcard(
    //           id: doc['id'],
    //           title: doc['title'],
    //           createdAt: (doc['createdAt'] as Timestamp).toDate(),
    //           updatedAt: (doc['updatedAt'] as Timestamp).toDate()),
    //     )
    //     .toList();
  }

  Future editFlashcard({required Flashcard flashCard}) async {
    await _flashcardsRefWithConverter.doc(flashCard.id).set(flashCard);
  }

  String getNewId() {
    return _flashcardsRef.doc().id;
  }
}
