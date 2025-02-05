import 'package:evently/services/snack_bar_serv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class FireBaseAuth {
  static Future<bool> createAccount(
      String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Account Created successfully");
      print('User registered: ${credential.user?.email}');
      EasyLoading.dismiss();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The account already exists for that email');
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The email address is not valid');
      } else {
        SnackBarService.showErrorMessage(
            e.message ?? 'FirebaseAuthException: ${e.message}');
      }
      EasyLoading.dismiss();
      return false;
    } catch (e) {
      print('Error: $e');
      EasyLoading.dismiss();
      return false;
    }
  }

  static Future<bool> login(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Logged in successfully");
      EasyLoading.dismiss();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(
            e.message ?? 'Wrong password provided for that user');
      } else {
        SnackBarService.showErrorMessage(
            e.message ?? 'FirebaseAuthException: ${e.message}');
      }
      EasyLoading.dismiss();
      return false;
    } catch (e) {
      print('Error: $e');
      EasyLoading.dismiss();
      return false;
    }
  }
}
