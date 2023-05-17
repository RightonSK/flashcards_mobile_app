import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/app.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/delete_account/delete_account_viewmodel.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteAccountPage extends ConsumerWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider保持用の監視
    final deleteAccountViewModel = ref.watch(deleteAccountProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('退会'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            const Text('退会するとあなたのユーザ情報が全て削除されます'),
            const Text('それでもよろしいですか？'),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              child: const Text('はい'),
              onPressed: () async {
                final isLoggedIn = await _showBottomSheet(context, ref);
                if (isLoggedIn) {
                  try {
                    //アカウントの削除
                    await deleteAccountViewModel.deleteAccount();
                    //削除成功後実行
                    await NotificationUtil.showTextDialog(
                        context: context, message: 'アカウントを削除しました');
                    await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginAndRegisterPage()),
                        (route) => false);
                  } on FirebaseAuthException catch (e) {
                    await NotificationUtil.showTextDialog(
                        context: context,
                        message: ConvertToErrorMessageUtil.convertErrorMessage(
                            e.code));
                  } catch (e) {
                    NotificationUtil.showTextSnackBar(
                        context: context,
                        message:
                            ConvertToErrorMessageUtil.convertErrorMessage(''));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> _showBottomSheet(BuildContext context, WidgetRef ref) async {
  //final deleteAccountState = ref.watch(deleteAccountProvider);
  final deleteAccountViewModel = ref.watch(deleteAccountProvider.notifier);
  final deviceHeight = MediaQuery.of(context).size.height;
  final unSafeAreaTop = MediaQuery.of(context).padding.top;
  final bottomSheetHeight =
      deviceHeight - unSafeAreaTop - AppBar().preferredSize.height;
  return await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: bottomSheetHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  TextField(
                    controller: deleteAccountViewModel.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'パスワード'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        //再ログイン
                        await deleteAccountViewModel.reLogin();
                        //ログイン成功時、trueを返す
                        Navigator.of(context).pop(true);
                      } on FirebaseAuthException catch (e) {
                        await NotificationUtil.showTextDialog(
                            context: context,
                            message:
                                ConvertToErrorMessageUtil.convertErrorMessage(
                                    e.code));
                        Navigator.of(context).pop(false);
                      } catch (e) {
                        Navigator.of(context).pop(false);
                        await Future.delayed(const Duration(milliseconds: 500));
                        NotificationUtil.showTextSnackBar(
                            context: context,
                            message:
                                ConvertToErrorMessageUtil.convertErrorMessage(
                                    ''));
                      }
                    },
                    child: const Text('確認'),
                  ),
                ],
              ),
            ),
          );
        },
      ) ??
      false;
}
