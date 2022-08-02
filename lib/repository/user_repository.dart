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
  /// userを取得
  ///
  Future<domain.User> find({required String uid}) async {
    final documentSnapshot = await _usersRefWithConverter.doc(uid).get();
    return (documentSnapshot.data()!);
  }

  ///
  /// userを新規で追加する。users collectionにもそのuser情報を追加する。
  ///
  Future<domain.User> add(
      {required String email, required String password}) async {
    //authに新規アカウントを追加
    final credential =
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // users collectionに新規追加
    await _usersRefWithConverter.doc(credential.user!.uid).set(domain.User(
        uid: credential.user!.uid,
        email: credential.user!.email!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()));

    final user = await find(uid: credential.user!.uid);
    return user;
  }

  ///
  /// ログイン。取得したUserデータからUserクラスを生成、return
  ///
  Future<domain.User> logIn(
      {required String email, required String password}) async {
    final credential = await auth.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = await find(uid: credential.user!.uid);
    return user;
  }
}
