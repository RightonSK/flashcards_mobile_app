import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/email_update/email_update_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/settings_viewmodel.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
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
    final user = ref.read(userProvider);
    final deviceHeight = MediaQuery.of(context).size.height;
    final itemHeight = deviceHeight / 12;
    print(itemHeight);
    final settingsViewModel = SettingsViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listTitles[index]),
            onTap: () async {
              // switch文
              switch (listTitles[index]) {
                case 'メールアドレス':
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EmailUpdatePage()));
                  break;
                case 'パスワード':
                  print('');
                  break;
                case 'ログアウト':
                  final bool result =
                      await settingsViewModel.logOut(context: context);
                  //ログアウトに成功したら、login pageにpush and remove
                  if (result) {
                    await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginAndRegisterPage()),
                        (route) => false);
                  }
                  break;
                case 'アカウントの削除':
                  print('');
                  break;
                default:
                  break;
              }
            },
          );
        },
      ),
      // body: SizedBox(
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(user!.uid),
      //       Text(user.email),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ElevatedButton(
      //             onPressed: () async {
      //               //一時的にここでログアウト処理を記述する
      //               await FirebaseAuth.instance.signOut();
      //               //ログアウトに成功したら、loginpageにpush and remove
      //               Navigator.of(context).pushAndRemoveUntil(
      //                   MaterialPageRoute(
      //                       builder: (context) => const LoginAndRegisterPage()),
      //                   (route) => false);
      //             },
      //             child: Text('ログアウト')),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
