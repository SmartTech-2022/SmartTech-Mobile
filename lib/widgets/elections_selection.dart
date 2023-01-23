import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/candidates.dart';
import 'package:onevote/screens/election_stats_screen.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/screens/vote.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/utils/navigator.dart';

class ElectionsSelection extends StatefulWidget {
  const ElectionsSelection({super.key});

  @override
  State<ElectionsSelection> createState() => _ElectionsSelectionState();
}

class _ElectionsSelectionState extends State<ElectionsSelection> {
  final int _selectedIndex = 2;
  bool hasVoted = true;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        goToPush(context, const Vote());
      } else if (index == 1) {
        goToPush(context, const HomeScreen());
      } else if (index == 0) {
        goToPush(context, const ElectionStatistics());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 60.0),
          child: Container(
            clipBehavior: Clip.none,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    goToPush(context, const CandidatesScreen(catId: 2,catName: "hello",));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MyContainer(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "PRESIDENTIAL ELECTION",
                          style: TextStyle(fontWeight: fnt600),
                        )),
                  ),
                );
              },
            ),
          ),
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
