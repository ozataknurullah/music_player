import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';
import 'package:music_player/features/homePage/presentation/home_screen.dart';
import 'package:music_player/features/onboardingPage/widgets/animated_dot.dart';
import 'package:music_player/features/onboardingPage/widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardContent(
                  image: onBoardData[0]['image'],
                  title: onBoardData[0]['title'],
                  text: onBoardData[0]['text'],
                );
              },
            ),
          ),

          /// Slider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                onBoardData.length,
                (index) => Padding(
                      padding: EdgeInsets.only(right: responsive.w(4)),
                      child: AnimatedDot(isActive: currentIndex == index),
                    )),
          ),

          SizedBox(
            height: responsive.h(20),
          ),

          /// Button
          GestureDetector(
            onTap: () {
              if (currentIndex == onBoardData.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } else {
                currentIndex++;
                _pageController.animateToPage(
                  currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Container(
              height: responsive.h(60),
              width: responsive.w(60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(responsive.w(10)),
              ),
              child: Image.asset("assets/icons/Arrow_left.png"),
            ),
          ),
          SizedBox(
            height: responsive.h(50),
          )
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> onBoardData = [
  {
    "image": "assets/images/onboard1.png",
    "title": "Podkes",
    "text":
        "A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.",
  },
  {
    "image": "assets/images/logo.png",
    "title": "Dinle",
    "text":
        "A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.",
  },
  {
    "image": "assets/images/logo.png",
    "title": "Hisset",
    "text":
        "A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.",
  },
];
