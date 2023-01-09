import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/widgets/onboarding.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  _seenOnBoard() async {
    int isSeen = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isSeen);
  }

  final controller = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondarycolor,
      body: Container(
        width: double.infinity,
        color: kSecondarycolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Onboarding(),
            // const Gap(20),
            // MyTextButton(
            //   onTap: () => goToPush(context, const LoginScreen()),
            //   text: 'Login',
            //   bgcolor: kPrimarycolor,
            //   fgcolor: kSecondarycolor,
            //   width: screenWidth * 0.9,
            // ),
            const Gap(20),
            MyTextButton(
              onTap: () {
                _seenOnBoard();
                goToReplace(context, const LoginScreen());
              },
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
