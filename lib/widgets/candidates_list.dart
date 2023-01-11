import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/candidates_profile_screen.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/utils/navigator.dart';

class CandidateList extends StatefulWidget {
  const CandidateList({super.key});

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () => goToPush(context, const CandidatesProfileScreen()),
              child: MyContainer(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                height: 180,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/pdp.png"),
                          radius: 20.0,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/atikusmall.png"),
                          radius: 30.0,
                        ),
                        const Gap(10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Atiku Abubakar",
                                style: TextStyle(
                                    color: kBlackcolor,
                                    fontWeight: fnt400,
                                    fontSize: 16.0),
                              ),
                            ),
                            Text(
                              "Atiku Abubakar GCON is a Nigerian politician\n and businessman who served as the vice\n president of Nigeria from 1999 to 2007\n during the presidency of Olusegun Obasanjo.",
                              style: TextStyle(
                                  color: kBlackcolor,
                                  fontWeight: fnt400,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
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
