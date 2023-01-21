import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/widgets/bottomnav.dart';
import 'package:onevote/widgets/stats_result_widget.dart';
import 'package:onevote/utils/navigator.dart';

class StatisticsResult extends StatefulWidget {
  const StatisticsResult({super.key});

  @override
  State<StatisticsResult> createState() => _StatisticsResultState();
}

class _StatisticsResultState extends State<StatisticsResult> {
  final int _selectedid = 0;
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
      bottomNavigationBar: BottomNavBars(selectedid: _selectedid),
    );
  }
}
