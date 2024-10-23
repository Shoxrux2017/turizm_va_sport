import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class NatijaScreen extends StatefulWidget {
  const NatijaScreen({super.key});

  @override
  State<NatijaScreen> createState() => _NatijaScreenState();
}

class _NatijaScreenState extends State<NatijaScreen> {
  int result = 0;
  int res1 = 0;
  int res2 = 0;
  int res3 = 0;
  String natija = "Past";

  Future<void> initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    res1 = prefs.getInt('q1')!;
    res2 = prefs.getInt('q2')!;
    res3 = prefs.getInt('q3')!;

    result = res1 + res2 + res3;
    setState(() {});

    if (result >= 3 && result <= 5) {
      natija = "Past";
    } else if (result >= 6 && result <= 8) {
      natija = "O'rtadan\n past";
    } else if (result >= 9 && result <= 11) {
      natija = "O'rta";
    } else if (result >= 12 && result <= 13) {
      natija = "Yuqoridan\n past";
    } else if (result >= 14 && result <= 15) {
      natija = "Yuqori";
    } else {
      natija = "Past";
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text(
              textAlign: TextAlign.center,
              "Natija".toUpperCase(),
              style: const TextStyle(
                color: AppColors.blueColor,
                decoration: TextDecoration.none,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
              ),
              child: Column(
                children: [
                  Text(
                    result.toString(),
                    style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    natija,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue[400]),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Boshlash",
                  style: TextStyle(fontSize: 50, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
