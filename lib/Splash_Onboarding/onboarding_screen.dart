import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:sport_va_turizm/introduction_screens/fifth_screen.dart';

import 'package:sport_va_turizm/introduction_screens/fourth_screen.dart';
import 'package:sport_va_turizm/introduction_screens/second_screen.dart';
import 'package:sport_va_turizm/introduction_screens/third_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              SecondScreen(),
              ThirdScreen(),
              FourthScreen(),
              FifthScreen(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.90),
            child: SmoothPageIndicator(controller: _controller, count: 5),
          )
        ],
      ),
    );
  }
}
