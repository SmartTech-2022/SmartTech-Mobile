import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/screens/statistics_result_screen.dart';
import 'package:onevote/widgets/bottomnav.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/utils/navigator.dart';

class ElectionStatistics extends StatefulWidget {
  const ElectionStatistics({super.key});

  @override
  State<ElectionStatistics> createState() => _ElectionStatisticsState();
}

class _ElectionStatisticsState extends State<ElectionStatistics> {
  final int _selectedid = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                  "Election Statistics",
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
            MyTextButton(
              onTap: () => goToPush(context, const StatisticsResult()),
              text: 'See Result',
              bgcolor: kPrimarycolor,
              fgcolor: kSecondarycolor,
              width: screenWidth,
              textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBars(selectedid: _selectedid),
    );
  }
}
