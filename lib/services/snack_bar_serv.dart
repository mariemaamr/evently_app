import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SnackBarService {
  /// Show a success message with Lottie animation
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 4),
            ],
          ),
          child: Row(
            children: [
              Lottie.asset(
                'assets/icons/happyface.json',
                width: 40,
                height: 40,
                repeat: false,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  msg,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 4),
            ],
          ),
          child: Row(
            children: [
              Lottie.asset(
                "assets/icons/sadface.json",
                width: 40,
                height: 40,
                repeat: false,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  msg,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}
