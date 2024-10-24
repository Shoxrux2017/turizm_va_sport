import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_va_turizm/Screens/homepage.dart';
import 'package:sport_va_turizm/Splash_Onboarding/splash_screen.dart';

import 'package:sport_va_turizm/main.dart';

import 'onboarding_screen.dart';

class CheckingScreen extends StatefulWidget {
  const CheckingScreen({super.key});

  @override
  State<CheckingScreen> createState() => _CheckingScreenState();
}

class _CheckingScreenState extends State<CheckingScreen> {
  @override
  void initState() {
    super.initState();
    // Call your timer function to navigate after 3 seconds
    startTimer();
  }

  void startTimer() {
    Timer(
      const Duration(seconds: 1),
      () {
        // Navigate to the main screen after 3 seconds
        if (nameOfUser != null) {
          Get.offAll(() => const SplashScreen());
        } else {
          Get.offAll(() => const OnBoardingScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
