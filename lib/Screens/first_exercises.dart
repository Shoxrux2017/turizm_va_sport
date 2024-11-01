import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_va_turizm/Screens/walking_screen.dart';

class FirstExercises extends StatefulWidget {
  const FirstExercises({super.key});

  @override
  State<FirstExercises> createState() => _FirstExercisesState();
}

class _FirstExercisesState extends State<FirstExercises> {
  String? _selectedGender;
  String? _natija;
  Map<String, List<dynamic>> resultsForBoys = {
    "past": [8, 12, 18, 24],
    "o'rtadan past": [12, 16, 22, 28],
    "o'rta": [16, 20, 26, 32],
    "yuqoridan past": [20, 24, 30, 36],
    "yuqori": [21, 26, 32, 40]
  };

  Map<String, List<dynamic>> resultsForGirls = {
    "past": [5, 8, 13, 18],
    "o'rtadan past": [6, 10, 16, 22],
    "o'rta": [8, 14, 20, 26],
    "yuqoridan past": [12, 18, 24, 30],
    "yuqori": [16, 22, 28, 34]
  };
  List _results = [8, 12, 18, 24];

  void _initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? gender = prefs.getString('selectingGender');
    String? level = prefs.getString('natija');

    setState(() {
      _selectedGender = gender ?? '';
      _natija = level ?? '';
    });

    if (_selectedGender == "male") {
      _results = resultsForBoys[_natija?.toLowerCase()]!;
      setState(() {});
    }

    if (_selectedGender == "female") {
      _results = resultsForGirls[_natija?.toLowerCase()]!;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "4-oylik uzluksiz yurish",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.to(WalkingScreen(
                  maxDistance: 0.67,
                  timeForWalk: _results[0],
                )),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   colorFilter: ColorFilter.mode(
                    //     const Color(0xff1ebdf8).withOpacity(.8),
                    //     BlendMode.lighten,
                    //   ),
                    //   image: AssetImage('assets/img/amirtemur.jpg'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.blue.withAlpha(100),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "1 OY",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 81, 40, 175)),
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/footstep.png"))),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          DefaultTextStyle.merge(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(
                                //   children: [
                                //     Icon(
                                //       Icons.run_circle_outlined,
                                //       size: 30,
                                //       color: Colors.white,
                                //     ),
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     Text("Kunlik shug'ullanish: 1-4"),
                                //   ],
                                // ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timer_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                        "Mashg'ulot davomiyligi: ${_results[0]} min"),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          // CircularPercentIndicator(
                          //   radius: 23.0,
                          //   lineWidth: 5.0,
                          //   animation: true,
                          //   percent: 50 / 100,
                          //   center: Text(
                          //     "${(_distance * 100 / 2.0).toString()}%",
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 12.0,
                          //         color: Colors.black),
                          //   ),
                          //   circularStrokeCap: CircularStrokeCap.round,
                          //   progressColor:
                          //       const Color.fromARGB(255, 255, 0, 242),
                          // ),
                          const SizedBox(width: 10)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.to(WalkingScreen(
                  maxDistance: 3.0,
                  timeForWalk: _results[1],
                )),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   colorFilter: ColorFilter.mode(
                    //     const Color(0xff1ebdf8).withOpacity(.8),
                    //     BlendMode.lighten,
                    //   ),
                    //   image: AssetImage('assets/img/amirtemur.jpg'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.blue.withAlpha(100),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "2 OY",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 81, 40, 175)),
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/footstep.png"))),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      Expanded(child: Container()),
                      DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.run_circle_outlined,
                            //       size: 30,
                            //       color: Colors.white,
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text("Kunlik shug'ullanish: 5-7"),
                            //   ],
                            // ),
                            // SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    "Mashg'ulot davomiyligi: ${_results[1]} min "),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.to(WalkingScreen(
                  maxDistance: 3.0,
                  timeForWalk: _results[2],
                )),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   colorFilter: ColorFilter.mode(
                    //     const Color(0xff1ebdf8).withOpacity(.8),
                    //     BlendMode.lighten,
                    //   ),
                    //   image: AssetImage('assets/img/amirtemur.jpg'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.blue.withAlpha(100),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "3 OY",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 81, 40, 175)),
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/footstep.png"))),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      Expanded(child: Container()),
                      DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.run_circle_outlined,
                            //       size: 30,
                            //       color: Colors.white,
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text("Kunlik shug'ullanish: 8-9"),
                            //   ],
                            // ),
                            // SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    "Mashg'ulot davomiyligi: ${_results[2]} min"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.to(WalkingScreen(
                  maxDistance: 4.0,
                  timeForWalk: _results[3],
                )),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   colorFilter: ColorFilter.mode(
                    //     const Color(0xff1ebdf8).withOpacity(.8),
                    //     BlendMode.lighten,
                    //   ),
                    //   image: AssetImage('assets/img/amirtemur.jpg'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.blue.withAlpha(100),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "4 OY",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 81, 40, 175)),
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/img/footstep.png"))),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      Expanded(child: Container()),
                      DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.run_circle_outlined,
                            //       size: 30,
                            //       color: Colors.white,
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text("Kunlik shug'ullanish: 10-12"),
                            //   ],
                            // ),
                            // SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    "Mashg'ulot davomiyligi: ${_results[3]} min"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
