import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sport_va_turizm/Screens/second_exercises.dart';
import 'package:sport_va_turizm/Screens/homepage.dart';
import 'package:sport_va_turizm/Splash_Onboarding/onboarding_screen.dart';
import 'package:sport_va_turizm/main.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
  Future<void> checkingPage() async {
    if (nameOfUser != null) {
      Get.offAll(() => const HomePage());
    } else {
      Get.offAll(() => const OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/img/illustration.png',
                  width: 300,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Text(
                  'Turizm va sport mobil ilovasi'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                MaterialButton(
                  onPressed: () => checkingPage(),
                  minWidth: double.infinity,
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text(
                    'Boshlash'.toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
