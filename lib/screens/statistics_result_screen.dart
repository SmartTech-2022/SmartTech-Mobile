import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/election_stats_screen.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/screens/vote.dart';
import 'package:onevote/widgets/stats_result_widget.dart';
import 'package:onevote/widgets/widget.dart';

class StatisticsResult extends StatefulWidget {
  const StatisticsResult({super.key});

  @override
  State<StatisticsResult> createState() => _StatisticsResultState();
}

class _StatisticsResultState extends State<StatisticsResult> {
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
                  "Presidential Statistics",
                  style: TextStyle(
                      fontSize: 16.0, color: kPrimarycolor, fontWeight: fnt500),
                )),
            const Gap(20),
            const Expanded(
              child: StatsResultWidget(),
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
