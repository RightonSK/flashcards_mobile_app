class ConvertToErrorMessageUtil {
  ConvertToErrorMessageUtil._();

  ///
  /// エラーメッセージコンバーター
  ///
  static String convertErrorMessage(String e) {
    switch (e) {
      case 'invalid-email':
        return 'メールアドレスを正しい形式で入力してください';
      case 'wrong-password':
        return 'パスワードが間違っています';
      case 'user-not-found':
        return 'ユーザーが見つかりません';
      case 'user-disabled':
        return 'ユーザーが無効です';
      case 'too-many-requests':
        return 'しばらく待ってからお試し下さい';
      case 'email-already-in-use':
        return '指定したメールアドレスは登録済みです';
      case 'operation-not-allowed':
        return '指定したメールアドレス・パスワードは現在使用できません';
      case 'weak-password':
        return 'パスワードは６文字以上にしてください';
      default:
        return '不明なエラーです';
    }
  }

  // //　ログイン用のエラーコンバーター
  // static String convertErrorMessageForLogin(String e) {
  //   switch (e) {
  //     case 'invalid-email':
  //       return 'メールアドレスを正しい形式で入力してください';
  //     case 'wrong-password':
  //       return 'パスワードが間違っています';
  //     case 'user-not-found':
  //       return 'ユーザーが見つかりません';
  //     case 'user-disabled':
  //       return 'ユーザーが無効です';
  //     case 'too-many-requests':
  //       return 'しばらく待ってからお試し下さい';
  //     default:
  //       return '不明なエラーです';
  //   }
  // }
  //
  // //　サインアップ用のエラーコンバーター
  // static String convertErrorMessageForSignup(String e) {
  //   switch (e) {
  //     case 'invalid-email':
  //       return 'メールアドレスを正しい形式で入力してください';
  //     case 'email-already-in-use':
  //       return '指定したメールアドレスは登録済みです';
  //     case 'operation-not-allowed':
  //       return '指定したメールアドレス・パスワードは現在使用できません';
  //     case 'weak-password':
  //       return 'パスワードは６文字以上にしてください';
  //     default:
  //       return '不明なエラーです';
  //   }
  // }
  //
  // // Forgot Password用のエラーメッセージコンバーター
  // static String convertErrorMessageForForgotPassword(String e) {
  //   switch (e) {
  //     case 'invalid-email':
  //       return 'メールアドレスを正しい形式で入力してください';
  //     case 'user-not-found':
  //       return 'ユーザーが見つかりません';
  //     case 'user-disabled':
  //       return 'ユーザーが無効です';
  //     case 'too-many-requests':
  //       return 'しばらく待ってからお試し下さい';
  //     default:
  //       return '不明なエラーです';
  //   }
  // }
}
