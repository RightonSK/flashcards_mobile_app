# Flashcard | 単語カードアプリ
自分で作る単語カードのアプリ。
このモバイルアプリは昔からある暗記法の単語カードをアプリ化したものです。表に単語、裏に単語の意味を記入し保存。
単語を保存したら、単語帳の暗記モードで、単語を覚えるために使用します。
ランダムで保存されてある単語が全て並びます。

## URL

app store
https://t.co/UQngFA7LmZ

google play store
https://t.co/lFdnBuD43n

## 画面一覧

|トップページ|単語カード追加ページ|単語カードページ|単語追加ページ|暗記モード|
|---|---|---|---|---|
|![image](https://github.com/RightonSK/flashcards_mobile_app/blob/images/top-page.png)|![](https://github.com/RightonSK/flashcards_mobile_app/blob/images/flashcard-add-page.png)|![](https://github.com/RightonSK/flashcards_mobile_app/blob/images/flashcard-page.png)|![](https://github.com/RightonSK/flashcards_mobile_app/blob/images/word-add-page.png)|![](https://github.com/RightonSK/flashcards_mobile_app/blob/images/flashcard-mode-page.png)|


## 使用技術
- Flutter
- Dart
- firebase
- firestore
- firebase_auth
- riverpod
- freezed

## ファイル構成やコードの構成
- ファイル構成
  主にdomain, presentation, repository, utilsに分けている。
  - repository
    repositoryのファイル群の役割は、プレゼンテーション層から渡されたデータを加工しデータベースに渡す。
    また、データベースから渡されたデータを加工し、プレゼンテーション層に引き渡す。
  - presentation
    描写に関わる層
  - domain
    
    
- コードの構成
  MVVM

## 機能一覧
- アカウントの登録削除、ログインログアウト機能
- チュートリアル機能
- 単語カード追加機能
- 単語追加機能(単語カードに追加していく)
- 暗記モード(単語カードに登録された単語をランダムに再生)
  
