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
      "image": "assets/Hello.svg",
      "text": "Tìm việc một cách nhanh chóng và tiện lợi",
      "title": "Chào mừng bạn đến với jobSeeker"
    },
    {
      "image": "assets/Lost.svg",
      "text":
          "Chúng tôi cung cấp thông tin tuyển dụng chi tiết và chất lượng, phù hợp với tiêu chí mà bạn chọn",
      "title": "Tìm công việc phù hợp với bạn"
    },
    {
      "image": "assets/Search.svg",
      "text":
          "Chúng tôi cập nhật thông tin tuyển dụng mới trong thời gian sớm nhất",
      "title": "Cập nhật thông tin nhanh chóng"
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
