import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/widgets/my_container.dart';

class StatsResultWidget extends StatefulWidget {
  const StatsResultWidget({super.key});

  @override
  State<StatsResultWidget> createState() => _StatsResultWidgetState();
}

class _StatsResultWidgetState extends State<StatsResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: MyContainer(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
              height: 120,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/sher2.png"),
                        radius: 30.0,
                      ),
                      const Gap(10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Sheriff Oborevwori",
                              style: TextStyle(
                                  color: kBlackcolor,
                                  fontWeight: fnt400,
                                  fontSize: 16.0),
                            ),
                          ),
                          Text(
                            "People Democratic Party",
                            style: TextStyle(
                                color: kBlackcolor,
                                fontWeight: fnt400,
                                fontSize: 11.0),
                          ),
                        ],
                      ),
                      Gap(screenWidth(context) * 0.20),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/pdp.png"),
                          radius: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Gap(screenWidth(context) * 0.20),
                      Text(
                        "4,039,190",
                        style: TextStyle(
                            color: kBlackcolor,
                            fontWeight: fnt400,
                            fontSize: 26.0,
                            height: 1.0),
                      ),
                      Image.asset("assets/images/arrowupright.png"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
