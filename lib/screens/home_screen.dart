import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  bool hasVoted = true;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondarycolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(screenHeight(context) * 0.08),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Hello Jeff,",
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
                Gap(screenHeight(context) * 0.26),
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
            const Gap(20),
            Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimarycolorlight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Upcoming Election Date:"),
                  Text(
                    "1st January 2023",
                    style: TextStyle(color: kBlackcolor, fontWeight: bold),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kPrimarycolor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                "Choose Election",
                style: TextStyle(
                    color: kSecondarycolor, fontWeight: bold, fontSize: 20.0),
              ),
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
            const Gap(30),
            hasVoted
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: ListTile(
                            tileColor: kimageplaceholder,
                            style: ListTileStyle.drawer,
                            shape: Border.all(
                              color: kPrimarycolorlight,
                              width: 1.0,
                            ),
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/sher2.png"),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Sheriff Oborevwori"),
                                Text(
                                  "People Democratic Party",
                                  style: TextStyle(
                                      color: kBlackcolor,
                                      fontWeight: bold,
                                      fontSize: 11.0),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "4,039,190",
                                  style: TextStyle(
                                      color: kBlackcolor,
                                      fontWeight: bold,
                                      fontSize: 24.0),
                                ),
                                Image.asset("assets/images/mic.png")
                              ],
                            ),
                            trailing: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/pdp.png"),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: screenHeight(context) * 0.15,
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
}
