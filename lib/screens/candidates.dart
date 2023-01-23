import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/widgets/bottomnav.dart';
import 'package:onevote/widgets/my_container.dart';
import 'package:onevote/models/election_candidates_model.dart';
import 'package:onevote/provider/candidate_list_provider.dart';
import 'package:onevote/screens/candidates_profile_screen.dart';
import 'package:onevote/utils/navigator.dart';

class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen(
      {required this.catId, required this.catName, super.key});
  final int catId;
  final String catName;
  @override
  State<CandidatesScreen> createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  final int _selectedid = 2;
  bool hasVoted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(screenHeight(context) * 0.08),
            TextButton.icon(
                onPressed: () {
                  goToPop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: kPrimarycolor,
                ),
                label: Text(
                  widget.catName.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16.0, color: kPrimarycolor, fontWeight: fnt500),
                )),
            const Gap(20),
            MyContainer(
              height: 50.0,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: kBlackcolor,
                    size: 26.0,
                  ),
                  hintText: "Search candidate",
                  hintStyle: TextStyle(fontWeight: fnt400, color: kBlackcolor),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Gap(10.0),
            Expanded(
              child: FutureBuilder<ElectionCandidatesModel>(
                  future:
                      CandidateListProvider().getCandidateList(widget.catId),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('Error Occured'));
                    } else if (snapshot.hasData) {
                      if (snapshot.data?.data?.contestants == null) {
                        return Center(
                            child: Text(
                          'No Candidates',
                          style: TextStyle(color: kBlackcolor, fontSize: 24),
                        ));
                      } else {
                        return Container(
                          clipBehavior: Clip.none,
                          child: ListView.builder(
                            itemCount: snapshot.data?.data?.contestants?.length,
                            itemBuilder: (context, index) {
                              final data =
                                  snapshot.data?.data?.contestants?[index];
                              return GestureDetector(
                                onTap: () => goToPush(
                                    context,
                                    CandidatesProfileScreen(
                                      candidateId: data.id!,
                                      candidateName: data.name!,
                                      partyLogo: data.partyLogo?? "https://inecnigeria.org/wp-content/uploads/2019/01/inec-logo-big-e1548855552200.jpg",
                                      image: data.image??"https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png",
                                      candidateAbout: data.about!,
                                    )),
                                child: MyContainer(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 20.0),
                                  height: 180,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/pdp.png"),
                                            radius: 20.0,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Text(
                                                  data!.name!,
                                                  style: TextStyle(
                                                      color: kBlackcolor,
                                                      fontWeight: fnt400,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                              Text(
                                                data.about!,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBars(selectedid: _selectedid),
    );
  }
}
