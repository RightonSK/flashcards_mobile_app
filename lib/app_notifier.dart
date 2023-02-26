import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/utils/convert_to_user_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appProvider = StateNotifierProvider<AppNotifier, AsyncValue<void>>(
    (ref) => AppNotifier(ref));

class AppNotifier extends StateNotifier<AsyncValue<void>> {
  AppNotifier(this._ref) : super(const AsyncData<void>(null)) {
    init(); // このproviderが呼ばれた時の初期化処理
  } // stateの初期値は常にnull
  final Ref _ref;

  ///
  /// ログイン状態の時にfirebase authのユーザ情報からこのプロジェクトの
  /// ユーザー情報に変換してユーザープロパイダに渡す。
  ///
  Future init() async {
    final userAuth = FirebaseAuth.instance.currentUser;
    // ログイン状態なら、ユーザ情報とデータ取得
    if (userAuth != null) {
      final user = await ConvertToUserUtil.convertUserFirebaseAuthToUser(
          userAuth: userAuth);
      _ref.read(userProvider.notifier).setUser(user);
    }
  }
}
