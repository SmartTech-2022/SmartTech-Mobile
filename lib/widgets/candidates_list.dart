import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/models/election_candidates_model.dart';
import 'package:onevote/provider/candidate_list_provider.dart';
import 'package:onevote/screens/candidates_profile_screen.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/utils/navigator.dart';

class CandidateList extends StatefulWidget {
  const CandidateList({super.key, required this.catId});
  final int catId;
  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: FutureBuilder<ElectionCandidatesModel>(
          future: CandidateListProvider().getCandidateList(widget.catId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Error Occured'));
            } else if (snapshot.hasData) {
              if (snapshot.data!.data == null) {
                return Center(
                    child: Text(
                  'No Candidates',
                  style: TextStyle(color: kBlackcolor, fontSize: 24),
                ));
              } else {
                return Container(
                  clipBehavior: Clip.none,
                  child: ListView.builder(
                    itemCount: snapshot.data!.data!.contestant!.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.data!.contestant![index];
                      return GestureDetector(
                        onTap: () =>
                            goToPush(context, const CandidatesProfileScreen()),
                        child: MyContainer(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                          height: 180,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/pdp.png"),
                                    radius: 20.0,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/atikusmall.png"),
                                    radius: 30.0,
                                  ),
                                  const Gap(10.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          data.name!,
                                          style: TextStyle(
                                              color: kBlackcolor,
                                              fontWeight: fnt400,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Text(
                                        data.about!
                                        , style: TextStyle(
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
                      );
                    },
                  ),
                );
              }
            } else {
               return Center(
                    child: CircularProgressIndicator(
                      color: kPrimarycolor,
                    ),
                  );
            }
          }),
    );
  }
}
