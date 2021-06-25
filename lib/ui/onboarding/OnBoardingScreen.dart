import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/ui/onboarding/pages.dart';

class OnBoardingScreen extends StatefulWidget {
  static const id = "OnboardingScreen";
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, String>> listOfScreen = [
    {
      "image": "assets/Lost.svg",
      "text": "lorem ipsum 1",
      "title": "lorem ipsum 1 "
    },
    {
      "image": "assets/Hello.svg",
      "text": "lorem ipsum 2",
      "title": "lorem ipsum 2"
    },
    {
      "image": "assets/Search.svg",
      "text": "lorem ipsum 3",
      "title": "lorem ipsum 3"
    },
  ];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: listOfScreen.length,
                itemBuilder: (context, index) => Pages(
                  image: listOfScreen[index]["image"]!,
                  title: listOfScreen[index]["title"]!,
                  text: listOfScreen[index]["text"]!,
                  index: index,
                ),
                onPageChanged: (page_num) {
                  setState(() {
                    i = page_num;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  position: i.toDouble(),
                ),
              ],
            ).pOnly(bottom: 50),
          ],
        ),
      ),
    );
  }
}
