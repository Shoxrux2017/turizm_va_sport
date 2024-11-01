import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_va_turizm/Screens/homepage.dart';

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

    res1 = prefs.getInt('q1') ?? 0;
    res2 = prefs.getInt('q2') ?? 0;
    res3 = prefs.getInt('q3') ?? 0;

    result = res1 + res2 + res3;
    setState(() {});

    if (result >= 3 && result <= 5) {
      natija = "Past";
    } else if (result >= 6 && result <= 8) {
      natija = "O'rtadan past";
    } else if (result >= 9 && result <= 11) {
      natija = "O'rta";
    } else if (result >= 12 && result <= 13) {
      natija = "Yuqoridan past";
    } else if (result >= 14 && result <= 15) {
      natija = "Yuqori";
    } else {
      natija = "Past";
    }
    await prefs.setString('natija', natija);
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
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Jis. tayyor. darajasi"),
                  SizedBox(width: 10),
                  Text("Yurish davomiyligi oylar kesimida"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 120),
                  Text("1-oy"),
                  SizedBox(width: 30),
                  Text("2-oy"),
                  SizedBox(width: 30),
                  Text("3-oy"),
                  SizedBox(width: 30),
                  Text("4-oy"),
                ],
              )
            ],
          )),
    );
  }
}
