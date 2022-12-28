import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/screens/onboarding.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight * 1,
        width: double.infinity,
        color: kSecondarycolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OnboardingScreen(),
            const Gap(20),
            MyTextButton(
              onTap: () => goToPush(context, const LoginScreen()),
              text: 'Login',
              bgcolor: kPrimarycolor,
              fgcolor: kSecondarycolor,
              width: screenWidth * 0.9,
            ),
            const Gap(20),
            MyTextButton(
              onTap: () => goToPush(context, const LoginScreen()),
              text: 'Register',
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
