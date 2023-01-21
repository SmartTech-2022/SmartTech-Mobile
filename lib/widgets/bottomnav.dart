import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/election_stats_screen.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/screens/vote.dart';
import 'package:onevote/utils/navigator.dart';

class BottomNavBars extends StatefulWidget {
  const BottomNavBars({super.key, required this.selectedid});
  final int selectedid;

  @override
  State<BottomNavBars> createState() => _BottomNavBarsState();
}

class _BottomNavBarsState extends State<BottomNavBars> {
  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        goToReplace(context, const Vote());
      } else if (index == 1) {
        goToReplace(context, const HomeScreen());
      } else if (index == 0) {
        goToReplace(context, const ElectionStatistics());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: BottomNavigationBar(
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
        currentIndex: widget.selectedid,
        selectedItemColor: kPrimarycolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
