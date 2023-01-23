import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/models/elections_model.dart';
import 'package:onevote/provider/election_provider.dart';
import 'package:onevote/screens/candidates.dart';
import 'package:onevote/screens/election_stats_screen.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/widgets/elections_selection.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/utils/navigator.dart';

class ElectionsCategory extends StatefulWidget {
  const ElectionsCategory({super.key});

  @override
  State<ElectionsCategory> createState() => _ElectionsCategoryState();
}

class _ElectionsCategoryState extends State<ElectionsCategory> {
  final int _selectedIndex = 2;
  bool hasVoted = true;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        goToPush(context, const ElectionsCategory());
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
        child: Container(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 60.0),
          child: Container(
            clipBehavior: Clip.none,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    goToPush(context, const ElectionsSelection());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MyContainer(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "INEC ELECTION",
                          style: TextStyle(fontWeight: fnt600, fontSize: 18.0),
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
