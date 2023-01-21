import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/candidates.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/utils/navigator.dart';

class VoteCardboard extends StatefulWidget {
  const VoteCardboard({super.key});

  @override
  State<VoteCardboard> createState() => _VoteCardboardState();
}

class _VoteCardboardState extends State<VoteCardboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                goToPush(context, const CandidatesScreen());
              },
              child: MyContainer(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                height: 150.0,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Presidential",
                          style: TextStyle(fontSize: 16.0, fontWeight: fnt400),
                        ),
                        Text(
                          "Upcoming",
                          style: TextStyle(fontSize: 14.0, fontWeight: fnt400),
                        )
                      ],
                    ),
                    Text(
                      "Parties 5",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: fnt400, height: 2),
                    ),
                    Text(
                      "Candidates  5",
                      style: TextStyle(fontSize: 14.0, fontWeight: fnt400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Align(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/sher2.png"),
                            ),
                          ),
                          Align(
                            widthFactor: 0.8,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/sher2.png"),
                            ),
                          ),
                          Align(
                            widthFactor: 0.8,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/sher2.png"),
                            ),
                          ),
                          Align(
                            widthFactor: 0.8,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/sher2.png"),
                            ),
                          ),
                          Align(
                            widthFactor: 0.8,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/sher2.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
