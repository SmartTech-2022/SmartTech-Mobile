import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Gap(screenHeight(context) * 0.10),
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
              height: screenHeight(context) * 0.25,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/fingermaker.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(children: [
                Positioned(
                  height: 50.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/rectangle.png"),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
