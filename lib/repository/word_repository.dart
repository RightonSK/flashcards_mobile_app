import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/word.dart';

class WordRepository {
  final _firebase = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> init(
      {required String flashcardId}) {
    return _firebase
        .collection('flashcards')
        .doc(flashcardId)
        .collection('words');
  }

  CollectionReference<Word> initWithConverter({required String flashcardId}) {
    return _firebase
        .collection('flashcards')
        .doc(flashcardId)
        .collection('words')
        .withConverter<Word>(
            fromFirestore: (snapshot, _) => Word.fromJson(snapshot.data()!),
            toFirestore: (word, _) => word.toJson());
  }

  Future<List<Word>> findAll(Flashcard flashcard) async {
    final wordsRef = initWithConverter(flashcardId: flashcard.id);
    final wordsSnapshot = await wordsRef.get();
    return wordsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future setWord(
      {required Word word, required Flashcard parentFlashcard}) async {
    final wordsRef = initWithConverter(flashcardId: parentFlashcard.id);
    await wordsRef.doc(word.id).set(word);
  }

  String getNewId({required String flashcardId}) {
    final wordsRef = init(flashcardId: flashcardId);
    return wordsRef.doc().id;
  }
}
