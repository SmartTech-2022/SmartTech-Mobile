import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 4,
        color: kPrimarycolor.withOpacity(0.9),
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
