import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/sucessful_screen.dart';
import 'package:onevote/widgets/elections.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/selected_candidate.dart';
import 'package:onevote/widgets/widget.dart';

class BallotScreen extends StatefulWidget {
  const BallotScreen({super.key});

  @override
  State<BallotScreen> createState() => _BallotScreenState();
}

class _BallotScreenState extends State<BallotScreen> {
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
                  "Ballot",
                  style: TextStyle(
                      fontSize: 16.0, color: kPrimarycolor, fontWeight: fnt500),
                )),
            const Gap(10),
            // const Expanded(
            //   child: MyVotes(),
            // ),
            // const Gap(20),
            GestureDetector(
              onTap: () {
                goToReplace(context, const ElectionsCategory());
              },
              child: MyContainer(
                height: 70.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add),
                      ),
                      Text(
                        "Select candidate in another category",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: fnt400, height: 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(10.0),
            const Expanded(
              child: SelectedCandidate(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11.0, 10.0, 11.0, 40.0),
              child: MyTextButton(
                onTap: () => goToReplace(context, const SuccessfulScreen()),
                text: 'Vote Now',
                bgcolor: kPrimarycolor,
                fgcolor: kSecondarycolor,
                width: screenWidth,
                textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.fromLTRB(11.0, 0, 11.0, 40.0),
      //   child: MyTextButton(
      //     onTap: () => goToReplace(context, const SuccessfulScreen()),
      //     text: 'Vote Now',
      //     bgcolor: kPrimarycolor,
      //     fgcolor: kSecondarycolor,
      //     width: screenWidth,
      //     textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
      //   ),
      // ),
    );
  }
}
