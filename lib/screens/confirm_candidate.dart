import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/sucessful_screen.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/utils/navigator.dart';

class ConfirmCandidateScreen extends StatefulWidget {
  const ConfirmCandidateScreen({super.key});

  @override
  State<ConfirmCandidateScreen> createState() => _ConfirmCandidateScreenState();
}

class _ConfirmCandidateScreenState extends State<ConfirmCandidateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 11.0, right: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(screenHeight(context) * 0.08),
            TextButton.icon(
                onPressed: () {
                  goToPop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: kPrimarycolor,
                ),
                label: Text(
                  "ATIKU ABUBAKAR",
                  style: TextStyle(
                      fontSize: 16.0, color: kPrimarycolor, fontWeight: fnt500),
                )),
            const Gap(10),
            Container(
              margin: EdgeInsets.only(
                  left: screenWidth(context) * 0.20,
                  right: screenWidth(context) * 0.20),
              width: screenWidth(context) * 0.55,
              height: screenHeight(context) * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/atiku1.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Gap(5),
            const Center(
                child: Text(
              "Are you sure you want to\r\n vote this candidate?",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )),
            Gap(screenHeight(context) * 0.15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextButton(
                  onTap: () => goToPush(context, const SuccessfulScreen()),
                  text: 'Yes',
                  bgcolor: kPrimarycolor,
                  fgcolor: kSecondarycolor,
                  width: screenWidth(context) * 0.35,
                  textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
                ),
                MyTextButton(
                  onTap: () => goToPop(context),
                  text: 'Cancel',
                  bgcolor: Colors.red,
                  fgcolor: kSecondarycolor,
                  width: screenWidth(context) * 0.35,
                  textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
