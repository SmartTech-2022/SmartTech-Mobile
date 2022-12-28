import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Flexible(
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
                      color: kBlackcolor, fontSize: 40, fontWeight: bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Make your vote count with the right vote, \n you can make your voice heard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kBlackcolor,
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ),
              const Gap(20),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const ScrollingDotsEffect(
                  activeStrokeWidth: 2.6,
                  activeDotScale: 1.3,
                  maxVisibleDots: 5,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/onboardchat.png',
                width: screenWidth * 1,
                height: screenHeight * 0.5,
                fit: BoxFit.contain,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Monitor the Elections",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kBlackcolor, fontSize: 35, fontWeight: bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
              const Gap(20),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const ScrollingDotsEffect(
                  activeStrokeWidth: 2.6,
                  activeDotScale: 1.3,
                  maxVisibleDots: 5,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
