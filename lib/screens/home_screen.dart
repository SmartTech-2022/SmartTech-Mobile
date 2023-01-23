import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/models/auth_model.dart';
import 'package:onevote/screens/election_stats_screen.dart';
import 'package:onevote/screens/vote.dart';
import 'package:onevote/widgets/elections.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/my_votes.dart';
import 'package:onevote/utils/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userValue;
  var userName;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  final int _selectedIndex = 1;
  bool hasVoted = false;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        goToPush(context, const Vote());
      } else if (index == 1) {
        goToReplace(context, const HomeScreen());
      } else if (index == 0) {
        goToPush(context, const ElectionStatistics());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ;
    //var userDecoded = json.decode(userValue!);
    //print(userDecoded);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondarycolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(screenHeight(context) * 0.08),
            Container(
              width: screenWidth *1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello $userName",
                        style: TextStyle(
                            color: kBlackcolor, fontSize: 20, fontWeight: bold),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/mappin.png"),
                          Text(
                            "Asaba, Delta",
                            style: TextStyle(color: kBlackcolor, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kimageplaceholder,
                    ),
                    child: Icon(
                      Icons.person,
                      color: kBlackcolor,
                      size: 29.0,
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            GestureDetector(
              onTap: () => goToPush(context, const Vote()),
              child: Container(
                  width: double.infinity,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimarycolorlight,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Upcoimg Election Date: ',
                      style: TextStyle(color: kBlackcolor),
                      children: <TextSpan>[
                        TextSpan(
                          text: '1st January 2023',
                          style:
                              TextStyle(color: kBlackcolor, fontWeight: bold),
                        ),
                      ],
                    ),
                  )),
            ),
            const Gap(10),
            MyTextButton(
              onTap: () => goToPush(context, const ElectionsCategory()),
              text: 'Choose Election',
              bgcolor: kPrimarycolor,
              fgcolor: kSecondarycolor,
              width: screenWidth,
            ),
            const Gap(30),
            Container(
              width: double.infinity,
              height: screenHeight(context) * 0.23,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/ad.png"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Text(""),
            ),
            hasVoted
                ? Text(
                    "My Votes",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackcolor,
                        fontWeight: fnt500,
                        height: 2),
                  )
                : Text("",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackcolor,
                        fontWeight: fnt500,
                        height: 3)),
            hasVoted
                ? const Expanded(
                    child: MyVotes(),
                  )
                : Container(
                    width: double.infinity,
                    height: screenHeight(context) * 0.10,
                    decoration: BoxDecoration(
                      color: ksurface2,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your votes will appear here after you vote.",
                          style: TextStyle(
                              color: kBlackcolor,
                              fontWeight: bold,
                              fontSize: 16.0),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Tap the “vote icon” "),
                            //Image.asset("assets/strokethumb.png"),
                            Icon(
                              Icons.thumb_up_outlined,
                              size: 16.0,
                            ),
                            Text(" to start voting..........")
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      )),
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

  void getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    userValue = pref.getString("user");
    var userGrup = [];

    if (userValue != null) {
      // decode json string if found
      var userDecoded = json.decode(userValue);

      setState(() {
        userGrup.add(userDecoded[0]);
        userName =userDecoded['name'];
      });
    }
    //Map userValue = jsonDecode(await SharedPreferenceHelper().getUserData());
    ;
  }
}
