import 'package:flutter/material.dart';
import 'package:myapp/src/auth_screens/signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  Widget build(BuildContext context) {
    return const MaterialApp(home: OnBoardingScreen());
  }

  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastScreen = false;
////////////////////////////////

/////////////////////////////
  Widget myOnBoardingScreens(
      {required String url,
      required String title,
      required String subtitle,
      required Color color}) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 275,
        width: 275,
        child: Image.asset(
          url,
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Text(
        title,
        style:
            TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color.withOpacity(0.4)),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastScreen = index == 2;
                });
              },
              children: [
                myOnBoardingScreens(
                    url: "assets/comment.png",
                    title: "Need More Focus?",
                    subtitle:
                        "Always Remmember Your Focus Determines Yor Reality, Your Life is Controlled By What You Focus ON.",
                    color: const Color(0xFF0B2E40)),
                myOnBoardingScreens(
                    url: "assets/e-commerce.png",
                    title: "Your Habits..?",
                    subtitle:
                        "If Your Habits Don't Line Up With Your Dream, Thn You Need Either To Change Your Habits or Change Your Dream.",
                    color: const Color(0xFF0B2E40)),
                myOnBoardingScreens(
                    url: "assets/SocialDelivery.png",
                    title: "Schedule Your Time ",
                    subtitle:
                        "Organize your Life around your Dreams and watch them come TRUE.",
                    color: const Color(0xFF0B2E40)),
              ],
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            child: Stack(children: [
              Center(
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut),
                    effect: ExpandingDotsEffect(
                        spacing: 24,
                        activeDotColor: const Color(0xFF0B2E40),
                        dotColor: const Color(0xFF0B2E40).withOpacity(0.6))),
              ),
              Positioned(
                  right: 10,
                  bottom: 15,
                  child: isLastScreen
                      ? Builder(
                          builder: (context) => Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignIn()),
                                    );
                                  },
                                  child: const Text('Start',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0B2E40))))),
                        )
                      : TextButton(
                          onPressed: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                          },
                          child: const Text(
                            "NEXT",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0B2E40)),
                          ))),
              Positioned(
                  left: 10,
                  bottom: 15,
                  child: Builder(
                    builder: (context) => Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: const Text('Skip',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B2E40))))),
                  ))
            ]),
          )),
    );
  }
}
