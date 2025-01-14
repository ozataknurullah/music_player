import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';
import 'package:music_player/features/homePage/presentation/home_screen.dart';

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
                      padding: const EdgeInsets.only(right: 4),
                      child: AnimatedDot(isActive: currentIndex == index),
                    )),
          ),

          SizedBox(
            height: 20,
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
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset("assets/icons/Arrow_left.png"),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
          color: isActive ? AppColors.accent : AppColors.textPrimary,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            child: Image.asset(
              image,
              height: 317,
              width: 240,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // PODKES heading
          Text(
            title,
            style: AppFonts.title,
          ),
          SizedBox(
            height: 20,
          ),
          // detail text
          Text(
            text,
            style: AppFonts.splashText,
          ),
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
