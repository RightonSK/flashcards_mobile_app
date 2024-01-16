import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/delete_account/delete_account_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/email_update/email_update_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/introduction/introductio_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/password_update/password_update_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/settings_viewmodel.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/navigation_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const List<String> listTitles = [
    'メールアドレス',
    'パスワード',
    'ログアウト',
    'アカウントの削除'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsViewModel = SettingsViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView.builder(
        itemCount: listTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listTitles[index]),
            onTap: () async {
              // switch文
              switch (listTitles[index]) {
                case 'メールアドレス':
                  await NavigationUtil.pushPage(
                      context: context,
                      fullscreenDialog: false,
                      page: const EmailUpdatePage());
                  break;
                case 'パスワード':
                  await NavigationUtil.pushPage(
                      context: context,
                      fullscreenDialog: false,
                      page: const PasswordUpdatePage());
                  break;
                case 'ログアウト':
                  try {
                    await settingsViewModel.logOut(context: context);
                    await NavigationUtil.pushAndRemoveAll(
                        context: context,
                        fullscreenDialog: true,
                        page: const LoginAndRegisterPage());
                  } on FirebaseAuthException catch (e) {
                    NotificationUtil.showTextSnackBar(
                        context: context,
                        message: ConvertToErrorMessageUtil.convertErrorMessage(
                            e.code));
                  } catch (e) {
                    NotificationUtil.showTextSnackBar(
                        context: context,
                        message:
                            ConvertToErrorMessageUtil.convertErrorMessage(''));
                  }
                  break;
                case 'アカウントの削除':
                  await NavigationUtil.pushPage(
                      context: context,
                      fullscreenDialog: false,
                      page: const DeleteAccountPage());
                  break;
                default:
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
