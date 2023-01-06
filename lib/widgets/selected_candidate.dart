import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/widgets/my_container.dart';

class SelectedCandidate extends StatefulWidget {
  const SelectedCandidate({super.key});

  @override
  State<SelectedCandidate> createState() => _SelectedCandidateState();
}

class _SelectedCandidateState extends State<SelectedCandidate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: MyContainer(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
              height: 110,
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
                            "Peoples Democratic Party (PDP)",
                            style: TextStyle(
                                color: kBlackcolor,
                                fontWeight: fnt400,
                                fontSize: 12.0),
                          ),
                          Text(
                            "House of Rep.",
                            style: TextStyle(
                                color: kBlackcolor,
                                fontWeight: fnt400,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                      Gap(screenWidth(context) * 0.08),
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
                      Gap(screenWidth(context) * 0.80),
                      Image.asset("assets/images/vectorcheck.png")
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
