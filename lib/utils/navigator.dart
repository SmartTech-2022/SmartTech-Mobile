import 'package:flutter/material.dart';

goToPush(BuildContext context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

goToReplace(BuildContext context, page) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

goToPop(BuildContext context) {
  return Navigator.pop(
    context);
}