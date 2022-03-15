import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';

class FlashCaredRepository {
  final CollectionReference _flashCardRef =
      FirebaseFirestore.instance.collection('flashcards');
  final _flashCardRefWithConverter = FirebaseFirestore.instance
      .collection('flashcards')
      .withConverter<Flashcard>(
          fromFirestore: (snapshot, _) => Flashcard.fromJson(snapshot.data()!),
          toFirestore: (flashcard, _) => flashcard.toJson());

  Future<List<Flashcard>> fetchAllFlashcards() async {
    final flashcardsSnapshot = await _flashCardRef.get();
    return flashcardsSnapshot.docs
        .map(
          (doc) => Flashcard(
              id: doc['id'],
              title: doc['title'],
              createdAt: (doc['createdAt'] as Timestamp).toDate(),
              updatedAt: (doc['updateAt'] as Timestamp).toDate()),
        )
        .toList();
  }

  Future editFlashcard({required Flashcard flashCard}) async {
    await _flashCardRefWithConverter.doc(flashCard.id).set(flashCard);
  }

  String getNewId() {
    return _flashCardRef.doc().id;
  }
}
