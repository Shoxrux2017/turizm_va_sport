import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_va_turizm/Screens/homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green[100],
        child: Center(
          child: ElevatedButton(
            onPressed: () => Get.to(const HomePage()),
            child: Text(
              "Boshlash".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
