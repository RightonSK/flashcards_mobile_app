import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flutter/material.dart';

class SettingsViewModel {
  Future<void> logOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
  }
}
