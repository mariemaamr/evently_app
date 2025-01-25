import 'package:evently/core/appAssets.dart';
import 'package:evently/core/constant/services/local_storage_keys.dart';
import 'package:evently/core/constant/services/local_storage_service.dart';
import 'package:evently/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
@override
  void initState() {
    super.initState();
    LocalStorage.setBool(LocalStorageKeys.isFirstTime, false);
  }
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/logo1.png",
      "title": "Personalize Your Experience",
      "description":
      "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
    },
    {
      "image": "assets/images/logo2.png",
      "title": "Find Events That Inspire You",
      "description":
      "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you."
    },
    {
      "image": "assets/images/logo3.png",
      "title": "Effortless Event Planning",
      "description":
      "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests."
    },
    {
      "image": "assets/images/logo4.png",
      "title": "Connect with Friends & Share Moments",
      "description":
      "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories."
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]["image"]!,
                title: onboardingData[index]["title"]!,
                description: onboardingData[index]["description"]!,
                index: index, // Pass the current index
                onStartPressed: () {
                  if (index == 0) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
          ),
          if (_currentPage > 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Image.asset("assets/images/back.png", width: 35),
                  ),
                  // Dots Indicator
                  Row(
                    children: List.generate(
                      onboardingData.length,
                          (index) => buildDot(index: index),
                    ),
                  ),
                  // Next Button
    TextButton(
    onPressed: () {
    if (_currentPage == onboardingData.length - 1) {
    Navigator.pushReplacementNamed(context, '/home');
    } else {
    _pageController.nextPage(
    duration: Duration(milliseconds: 300),
    curve: Curves.ease,
    );
    }
    },
      child: Image.asset("assets/images/next.png", width: 30),
    ),
    ],
    ),
            ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;
  final VoidCallback onStartPressed;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.index,
    required this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Logo
          if (index == 0)
            Image.asset(
              AppAssets.onBoardingLogo,
              height: 50,
            ),


          Image.asset(image, height: 350),


          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          if (index == 0) ...[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Language",
                      style: TextStyle(fontSize: 18,
    color: AppColors.primaryColor),
                    ),

                    Row(
                      children: [
                        Image.asset('assets/images/us_flag.png', height: 24),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/eg_flag.png', height: 24),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Theme",
                      style: TextStyle(fontSize: 18,
                      color: AppColors.primaryColor),
                    ),
                    Row(
                      children: [
                        Icon(Icons.light_mode, color: Colors.blue),
                        const SizedBox(width: 8),
                        Icon(Icons.dark_mode, color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),


            ElevatedButton(
              onPressed:onStartPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                "Let's Start",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
