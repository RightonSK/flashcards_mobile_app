import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flashcards_mobile_app/domain/flashcard.dart';
import 'package:flashcards_mobile_app/domain/user.dart' as domain;

class UserRepository {
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('users');

  final _usersRefWithConverter = FirebaseFirestore.instance
      .collection('users')
      .withConverter<domain.User>(
          fromFirestore: (snapshot, _) =>
              domain.User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());

  ///
  /// userを新規で追加する
  ///
  Future add({required String email, required String password}) async {
    //await _usersRefWithConverter.doc(flashCard.id).set(flashCard);

    final credential =
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _usersRefWithConverter.add(domain.User(
        uid: credential.user!.uid,
        email: credential.user!.email!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()));
  }

  ///
  /// ログイン
  ///
  Future logIn({required String email, required String password}) async {
    final credential = await auth.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  ///
  /// flashcardを更新
  ///
  Future updateFlashcard({required Flashcard flashcard}) async {
    await _usersRef
        .doc(flashcard.id)
        .update({'title': flashcard.title, 'updatedAt': flashcard.updatedAt});
  }

  ///
  /// flashcardを削除
  ///
  Future deleteFlashcard({required String flashcardId}) async {
    await _usersRef.doc(flashcardId).delete();
  }

  ///
  /// 新規で追加する際に新規のidを発行
  ///
  String getNewId() {
    return _usersRef.doc().id;
  }
}
