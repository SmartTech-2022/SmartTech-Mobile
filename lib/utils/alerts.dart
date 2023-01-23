import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

showSnackBar(String message) {
  scaffoldMessengerKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 4),
      backgroundColor: kPrimarycolorlight,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}

void showAlertDialog({
  required BuildContext context,
  required String title,
  required Widget widget,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kPrimarycolorlight,
          title: Text(title),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
          content: widget,
        );
      });
}

startCircularProgress(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 10.0,
        ),
      );
    },
  );
}

void stopCircularProgress(BuildContext context) {
  Navigator.of(context).pop();
}
