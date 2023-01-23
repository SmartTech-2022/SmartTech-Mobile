import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/sucessful_screen.dart';
import 'package:onevote/utils/navigator.dart';
import 'package:onevote/widgets/my_text_button.dart';

class CandidatesProfileScreen extends StatefulWidget {
  const CandidatesProfileScreen(
      {required this.candidateId,
      required this.candidateName,
      required this.image,
      required this.partyLogo,
      required this.candidateAbout,
      super.key});
  final int candidateId;
  final String candidateName;
  final String image;
  final String partyLogo;
  final String candidateAbout;
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
                  widget.candidateName.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16.0, color: kPrimarycolor, fontWeight: fnt500),
                )),
            const Gap(10),
            Container(
              width: double.infinity,
              height: screenHeight(context) * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image:  DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 widget.candidateName,
                  style: TextStyle(fontWeight: fnt700, fontSize: 16.0),
                ),
                 CircleAvatar(
                  backgroundImage: NetworkImage(widget.partyLogo),
                  radius: 25.0,
                ),
              ],
            ),
            const Gap(10),
            Text(
                widget.candidateAbout,
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
