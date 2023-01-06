import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/widget.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({super.key});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 11.0, right: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(screenHeight(context) * 0.18),
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                width: 157,
                height: 157,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kPrimarycolor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset("assets/images/bigthumb.png"),
              ),
            ),
            Text(
              "Congratulations!",
              style: TextStyle(fontSize: 14.0, fontWeight: fnt400, height: 2.0),
            ),
            Text(
              "Your vote was successful",
              style: TextStyle(fontSize: 12.0, fontWeight: fnt400),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(11.0, 0, 11.0, 40.0),
        child: MyTextButton(
          onTap: () => goToReplace(context, const HomeScreen()),
          text: 'Go Back Home',
          bgcolor: kPrimarycolor,
          fgcolor: kSecondarycolor,
          width: screenWidth,
          textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
        ),
      ),
    );
  }
}
