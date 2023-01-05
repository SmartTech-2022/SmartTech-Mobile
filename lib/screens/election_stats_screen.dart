import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/screens/statistics_result_screen.dart';
import 'package:onevote/screens/vote.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/widget.dart';

class ElectionStatistics extends StatefulWidget {
  const ElectionStatistics({super.key});

  @override
  State<ElectionStatistics> createState() => _ElectionStatisticsState();
}

class _ElectionStatisticsState extends State<ElectionStatistics> {
  final int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        goToPush(context, const Vote());
      } else if (index == 1) {
        goToReplace(context, const HomeScreen());
      } else if (index == 0) {
        goToReplace(context, const ElectionStatistics());
      }
    });
  }

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
                  goToPop(context);
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
              onTap: () => goToReplace(context, const StatisticsResult()),
              text: 'See Result',
              bgcolor: kPrimarycolor,
              fgcolor: kSecondarycolor,
              width: screenWidth,
              textStyle: TextStyle(fontWeight: fnt500, fontSize: 16.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_outlined),
            label: '',
          ),
        ],
        backgroundColor: kSecondarycolor,
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimarycolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
