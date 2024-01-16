
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final passwordUpdateViewModel = ref.watch(passwordUpdateProvider.notifier);
    return Scaffold(
      body: SafeArea(
        // ここでIntroductionScreenのライブラリーを呼び出している
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              // \nは改行を意味しているよ！

              title: '定番の暗記法である\n単語カードのアプリ化！',
              body: '自分だけの単語カードを作り、単語を覚えていこう\n\n手書きよりも簡単に早く作れて使いやすい！',
              //image: Image.asset("assets/introfirst.png"),
              image: Container(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/introfirst.png'),
                ),
                color: Colors.black,
              ),
            ),
            PageViewModel(
              title: '1. 単語カードを作成しよう！',
              body:
              'トップページの右下のプラスボタンから作成画面移動し、単語カードを作成。',
              //image: Image.asset('assets/images/second.png'),
            ),
            PageViewModel(
              title: '2. 単語を作成しよう！',
              body: 'トップページの単語カードをタップすると単語カードのページに遷移します\n\n同様にプラスボタンから作成画面に移動し、単語を作成',
              image: Image.asset('assets/images/third.png'),
            ),
            PageViewModel(
              title: '3. 単語を覚えよう！',
              body: '単語がある程度作れたら、暗記モードで単語を覚えよう！\n\n暗記モード起動は、ダークグレーアプリバーの再生ボタンをタップ\n\n(アプリバーは単語カードを長押しすると現れます)',
              image: Image.asset('assets/images/third.png'),
            ),
            PageViewModel(
              title: '暗記モード',
              body: '画像',
              image: Image.asset('assets/images/third.png'),
            ),
          ],
          onDone: () async => Navigator.pop(context),
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_ios),
          back: const Icon(Icons.arrow_back_ios),
          done: const Text(
            'OK!',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            // ここの大きさを変更することで
            // 現在の位置を表しているマーカーのUIが変更するよ!
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blue,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}