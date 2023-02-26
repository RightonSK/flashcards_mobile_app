import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flashcards_mobile_app/domain/user.dart';
import 'package:flashcards_mobile_app/utils/convert_to_user_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final userProvider = FutureProvider((ref) {
//   final userAuth = auth.FirebaseAuth.instance.currentUser;
//   return ConvertToUserUtil.convertUserFirebaseAuthToUser(userAuth: userAuth!);
// });

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void setUser(User user) {
    print('user notifier: ${user.uid}');
    state = user;
  }
}
