import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/sucessful_screen.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/utils/navigator.dart';

class CandidatesProfileScreen extends StatefulWidget {
  const CandidatesProfileScreen({super.key});

  @override
  State<CandidatesProfileScreen> createState() =>
      _CandidatesProfileScreenState();
}

class _CandidatesProfileScreenState extends State<CandidatesProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
              width: double.infinity,
              height: screenHeight(context) * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/atiku1.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ATIKU ABUBAKAR",
                  style: TextStyle(fontWeight: fnt700, fontSize: 16.0),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pdp.png"),
                  radius: 25.0,
                ),
              ],
            ),
            const Gap(10),
            Text(
                "Atiku Abubakar GCON is a Nigerian politician and businessman who served as the vice president of Nigeria from 1999 to 2007 during the presidency of Olusegun Obasanjo.",
                style: TextStyle(
                  fontWeight: fnt500,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.justify),
            const Gap(30),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(11.0),
        child: MyTextButton(
          onTap: () => goToPush(context, const SuccessfulScreen()),
          text: 'Vote Candidate',
          bgcolor: kPrimarycolor,
          fgcolor: kSecondarycolor,
          width: screenWidth,
          textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
        ),
      ),
    );
  }
}
