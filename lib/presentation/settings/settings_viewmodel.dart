import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flutter/material.dart';

class SettingsViewModel {
  //

  Future<bool> logOut({required BuildContext context}) async {
    bool returnedValue = false;
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        returnedValue = true;
      });
      return returnedValue;
    } catch (e) {
      if (e is FirebaseAuthException) {
        print('FirebaseAuthException caught: $e');
        // handle specific FirebaseAuthException error codes here
      } else {
        print('Error signing out: $e');
      }
      return returnedValue;
    }
  }
}
