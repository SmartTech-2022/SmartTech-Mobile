import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: kSecondarycolor,
      width: screenWidth * 1,
      height: screenHeight * 0.7,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/handvote.png',
                      width: screenWidth * 1,
                      height: screenHeight * 0.5,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Elect a Candidate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kBlackcolor, fontSize: 30, fontWeight: bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/onboardingchart.png',
                      width: screenWidth * 1,
                      height: screenHeight * 0.5,
                      //color: Color.fromARGB(255, 248, 248, 246),
                      //fit: BoxFit.fill,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Monitor the Elections",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kBlackcolor, fontSize: 30, fontWeight: bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Watch the election results as \n they come in live without being left out",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kBlackcolor,
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 2,
            effect: ScrollingDotsEffect(
              activeStrokeWidth: 2.6,
              activeDotScale: 1.3,
              maxVisibleDots: 5,
              radius: 8,
              spacing: 10,
              dotHeight: 9,
              dotWidth: 9,
              dotColor: Colors.grey,
              activeDotColor: kPrimarycolor,
            ),
            onDotClicked: (index) => controller.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn),
          ),
          const Gap(30)
        ],
      ),
    );
  }
}
