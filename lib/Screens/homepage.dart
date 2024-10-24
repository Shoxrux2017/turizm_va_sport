import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_va_turizm/Screens/second_exercises.dart';
import 'package:sport_va_turizm/Screens/first_exercises.dart';
import 'package:sport_va_turizm/Splash_Onboarding/onboarding_screen.dart';

import 'package:sport_va_turizm/Splash_Onboarding/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.to(const Welcome()),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.to(const OnBoardingScreen()),
                child: Container(
                  alignment: const Alignment(0, 0),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(100),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "Jismoniy tayyorgarlikni hisoblash",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'RubikBold',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.to(const FirstExercises()),
                child: Container(
                  alignment: const Alignment(0, 0),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(100),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "4-oylik mashg'ulot uchun bir mashg'ulotda uzluksiz yurishning taxminiy davomiyligini aniqlash metodikasi",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'RubikBold',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.to(const SecondExercises()),
                child: Container(
                  alignment: const Alignment(0, 0),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(100),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "Taxminan masofa va birinchi o'ttizda yurish vaqti",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'RubikBold',
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
