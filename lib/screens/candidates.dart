import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/widgets/bottomnav.dart';
import 'package:onevote/widgets/candidates_list.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/widgets/widget.dart';

class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen({super.key});

  @override
  State<CandidatesScreen> createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  final int _selectedid = 2;
  bool hasVoted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  "Presidential (5)",
                  style: TextStyle(
                      fontSize: 16.0, color: kPrimarycolor, fontWeight: fnt500),
                )),
            const Gap(20),
            MyContainer(
              height: 50.0,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: kBlackcolor,
                    size: 26.0,
                  ),
                  hintText: "Search candidate",
                  hintStyle: TextStyle(fontWeight: fnt400, color: kBlackcolor),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Gap(10.0),
            const Expanded(child: CandidateList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBars(selectedid: _selectedid),
    );
  }
}
