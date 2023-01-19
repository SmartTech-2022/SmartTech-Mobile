import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  int? seconds,
}) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: seconds ?? 3), // 3 sec default
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

void startCircularProgress(BuildContext context) {
  showDialog(
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