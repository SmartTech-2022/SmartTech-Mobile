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
                        style: TextStyle(
                            color: kBlackcolor, fontSize: 14, fontWeight: bold),
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
                  color: kPrimarycolorlight,
                ),
                child: Icon(
                  Icons.person,
                  color: kBlackcolor,
                  size: 29.0,
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
