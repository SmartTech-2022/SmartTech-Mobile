import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight*1,
        width: screenWidth*1,
        color: kSecondarycolor,
      ),
    );
  }
}
