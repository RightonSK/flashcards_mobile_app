import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flashcards_mobile_app/domain/user.dart' as domain;

class ConvertToUserUtil {
  // users collectinにアクセスして(repository経由)、ユーザー情報を取得に修正
  static domain.User convertUserFirebaseAuthToUser(
      {required auth.User userAuth}) {
    return domain.User(
        uid: userAuth.uid,
        email: userAuth.email!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }
}
