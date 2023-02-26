import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user!.uid),
            Text(user.email),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    //一時的にここでログアウト処理を記述する
                    await FirebaseAuth.instance.signOut();
                    //ログアウトに成功したら、loginpageにpush and remove
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginAndRegisterPage()),
                        (route) => false);
                  },
                  child: Text('ログアウト')),
            ),
          ],
        ),
      ),
    );
  }
}
