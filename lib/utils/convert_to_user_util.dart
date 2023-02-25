import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flashcards_mobile_app/domain/user.dart' as domain;
import 'package:flashcards_mobile_app/repository/user_repository.dart';

class ConvertToUserUtil {
  // uidを基にusers collectionからユーザー情報を取得し、Userクラスとして返す
  static Future<domain.User> convertUserFirebaseAuthToUser(
      {required auth.User userAuth}) async {
    final userRepository = UserRepository();
    final user = await userRepository.find(uid: userAuth.uid);
    return user;
    // // ↓実験用
    // return domain.User(
    //     uid: '',
    //     email: userAuth.email!,
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now());
  }
}
