import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/email_update/email_update_notifier.dart';
import 'package:flashcards_mobile_app/utils/convert_error_message_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailUpdatePage extends ConsumerWidget {
  const EmailUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailUpdateState = ref.watch(emailUpdateProvider);
    final emailUpdateNotifier = ref.watch(emailUpdateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メールアドレス設定'),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('現在のメールアドレス'),
            Text(emailUpdateState.email),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'メールアドレス',
                    hintText: 'メールアドレス'),
                controller: emailUpdateNotifier.emailController,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final isLoggedIn = await _showBottomSheet(context, ref);
                if (isLoggedIn) {
                  try {
                    await emailUpdateNotifier.updateEmail();
                    //アップデート出来たら実行される。
                    await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginAndRegisterPage()),
                        (route) => false);
                  } on FirebaseAuthException catch (e) {
                    await _showTextDialog(
                        context,
                        ConvertErrorMessageUtil.convertErrorMessageForLogin(
                            e.code));
                  }
                }
              },
              child: const Text('変更'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> _showBottomSheet(BuildContext context, WidgetRef ref) async {
  final emailUpdateState = ref.watch(emailUpdateProvider);
  final emailUpdateNotifier = ref.watch(emailUpdateProvider.notifier);
  final deviceHeight = MediaQuery.of(context).size.height;
  final unSafeAreaTop = MediaQuery.of(context).padding.top;
  final bottomSheetHeight = deviceHeight - unSafeAreaTop;
  return await showModalBottomSheet(
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
                  const Text('現在のメールアドレス'),
                  Text(emailUpdateState.email),
                  TextField(
                    controller: emailUpdateNotifier.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'パスワード'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await emailUpdateNotifier.reLogin();
                        //ログイン成功時、trueを返す
                        Navigator.of(context).pop(true);
                      } on FirebaseAuthException catch (e) {
                        await _showTextDialog(
                            context,
                            ConvertErrorMessageUtil.convertErrorMessageForLogin(
                                e.code));
                        Navigator.of(context).pop(false);
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

/// メールアドレス入力の際のエラー表示用ダイアログ
_showTextDialog(context, message) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
