import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_va_turizm/Screens/walking_screen.dart';

class SecondExercises extends StatefulWidget {
  const SecondExercises({super.key});

  @override
  State<SecondExercises> createState() => _SecondExercisesState();
}

class _SecondExercisesState extends State<SecondExercises> {
  var _distance = 0.0;

  void _readSteps() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _distance = prefs.getDouble('steps') ?? 0;
    setState(() {});
    print('distance');
    print(_distance);
  }

  @override
  void initState() {
    _readSteps();
    print('distance');
    print(_distance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Berilgan masofaga yurish",
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 2.0,
                  timeForWalk: 30,
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
                            "2 KM",
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
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.run_circle_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Kunlik shug'ullanish: 1-4"),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text("Mashg'ulot davomiyligi: 30"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 3.0,
                  timeForWalk: 45,
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
                            "3 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 5-7"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 45"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 3.0,
                  timeForWalk: 42,
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
                            "3 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 8-9"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 42"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 4.0,
                  timeForWalk: 56,
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
                            "4 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 10-12"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 56"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 4.0,
                  timeForWalk: 52,
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
                            "4 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 13-15"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 52"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 5.0,
                  timeForWalk: 65,
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
                            "5 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 16-18"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 65"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 5.0,
                  timeForWalk: 60,
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
                            "5 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 19-21"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 60"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 6.0,
                  timeForWalk: 72,
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
                            "6 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 22-24"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 72"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 6.0,
                  timeForWalk: 66,
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
                            "6 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 24-25"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 66"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 7.0,
                  timeForWalk: 77,
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
                            "7 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 26-27"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 77"),
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
                onTap: () => Get.to(const WalkingScreen(
                  maxDistance: 8.0,
                  timeForWalk: 80,
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
                            "8 KM",
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
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kunlik shug'ullanish: 28-30"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text("Mashg'ulot davomiyligi: 80"),
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
