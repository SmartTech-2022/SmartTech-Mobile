import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';
import 'dart:async';
import 'package:onevote/screens/onboarding_screen.dart';
import 'package:onevote/utils/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => goToReplace(context, const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimarycolor,
      child: logo,
    );
  }
}
