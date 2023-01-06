import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/widgets/bottomnav.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/widgets/vote_cardboard.dart';
import 'package:onevote/widgets/widget.dart';

class Vote extends StatefulWidget {
  const Vote({super.key});

  @override
  State<Vote> createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  final int _selectedid = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(screenHeight(context) * 0.08),
            TextButton.icon(
                onPressed: () {
                  goToReplace(context, const HomeScreen());
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: kPrimarycolor,
                ),
                label: Text(
                  "Vote",
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
                  hintText: "Search category",
                  hintStyle: TextStyle(fontWeight: fnt400, color: kBlackcolor),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Gap(10.0),
            const Expanded(child: VoteCardboard()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBars(selectedid: _selectedid),
    );
  }
}
