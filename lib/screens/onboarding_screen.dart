import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/screens/onboarding.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondarycolor,
      body: Container(
        height: screenHeight * 1,
        width: double.infinity,
        color: kSecondarycolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Onboarding(),
            const Gap(20),
            MyTextButton(
              onTap: () => goToPush(context, const LoginScreen()),
              text: 'Log in',
              bgcolor: kSecondarycolor,
              fgcolor: kPrimarycolor,
              width: screenWidth * 0.9,
              textStyle: TextStyle(
                  color: kPrimarycolor, fontWeight: bold, fontSize: 20),
              borderSide: BorderSide(width: 1.0, color: kPrimarycolor),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
