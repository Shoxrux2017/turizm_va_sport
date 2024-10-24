import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalkingScreen extends StatefulWidget {
  final double maxDistance;
  final int timeForWalk;

  const WalkingScreen(
      {super.key, required this.maxDistance, required this.timeForWalk});
  @override
  WalkingScreenState createState() => WalkingScreenState();
}

class WalkingScreenState extends State<WalkingScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  int _initialSteps = 0; // Store the initial step count
  String _status = "";
  String _steps = '0';
  final double _stepLength = 0.78;
  double _distance = 0.0;
  double _percent = 0;
  double _calories = 0.0; // To store calories
  double _userWeight = 70.0; // Assume an average weight (kg)
  bool _isTracking = false;

  Timer? _timer;
  String _statusText = "Noma'lum";

  late int _remainingTime;

  late double _distanceGoal;
  late var distancetoStep;

  // Calories burned per step (approximation based on weight)
  double _caloriesPerStep(double weight) {
    return 0.04 * (weight / 70.0); // Adjust based on the user's weight
  }

  Future<void> _writeSteps() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble('steps', _distance);
  }

  void testFunc() async {
    await _writeSteps();
  }

  @override
  void initState() {
    super.initState();
    distancetoStep = (widget.maxDistance * 1000 / 0.78).round();
    _distanceGoal = widget.maxDistance;
    _remainingTime = widget.timeForWalk * 60;
  }

  void startTracking() {
    setState(() {
      _isTracking = true;
    });

    // Start the countdown timer (1 second interval)
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--; // Decrease the remaining time by 1 second
        }
        if (_remainingTime <= 0 || _distance >= _distanceGoal) {
          pauseTracking(); // Automatically pause when time or distance goal is met
        }
      });
    });
    initPlatformState();
  }

  void pauseTracking() {
    setState(() {
      _isTracking = false;
    });

    _timer?.cancel(); // Stop the timer
  }

  void onStepCount(StepCount event) {
    setState(() {
      if (_initialSteps == 0) {
        // Store the initial step count on the first event
        _initialSteps = event.steps;
      }
      // Calculate steps relative to the initial steps
      int currentSteps = event.steps - _initialSteps;
      _steps = currentSteps.toString();
      _distance = currentSteps * _stepLength / 1000;
      _percent =
          (int.parse(_steps) * 100 / 2564).toDouble(); // Distance in kilometers
      _calories = ((0.035 * 70) + (4 * 0.029 * 70)) / 60; // Calories
    });

    if (_timer == 0) {}

    testFunc();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);

    setState(() {
      if (event.status == 'walking') {
        _statusText = "Yurish";
      }
      if (event.status == 'stopped') {
        _statusText = "To'xtash";
      }
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = "Noma'lum";
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = '0';
    });
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;

    if (!granted) {
      granted = await Permission.activityRecognition.request() ==
          PermissionStatus.granted;
    }

    return granted;
  }

  Future<void> initPlatformState() async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      // tell user, the app will not work
    }

    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    (await _pedestrianStatusStream.listen(onPedestrianStatusChanged))
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  // Helper to format time in mm:ss
  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Qadamni hisoblash dasturi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor.withAlpha(50),
                  ),
                  child: Image.asset(
                    'assets/img/shoe.png',
                    width: 60,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                Text(
                  _steps,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 80,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$_steps Qadam'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '≈ $distancetoStep Qadam'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: _percent / 100,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withAlpha(30),
                        progressColor: Theme.of(context).primaryColor,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 15,
                  color: Colors.grey[300],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Masofa',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${_distance.toStringAsFixed(2)} ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' km',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       'Kaloriya',
                    //       style: TextStyle(
                    //         color: Theme.of(context).primaryColor,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     RichText(
                    //       text: TextSpan(
                    //         children: [
                    //           TextSpan(
                    //             text: _calories.toStringAsFixed(2),
                    //             style: TextStyle(
                    //               fontSize: 20,
                    //               color:
                    //                   Theme.of(context).colorScheme.secondary,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           const TextSpan(
                    //             text: ' cal',
                    //             style: TextStyle(
                    //               color: Colors.grey,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                Text('Berilgan vaqt: ${formatTime(_remainingTime)}'),
                const SizedBox(height: 15),
                // Display a message if user is on pace to complete 2 km in 30 minutes
                if (_remainingTime == 0 && _distance >= widget.maxDistance)
                  const Text(
                    "Berilgan vazifani bajardingiz",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                if (_remainingTime == 0 && _distance < widget.maxDistance)
                  const Text(
                    "Berilgan vazifani o'z vaqtida bajara olmadingiz!!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                const Text(
                  'Yurish holati',
                  style: TextStyle(fontSize: 30),
                ),
                Icon(
                  _status == 'walking'
                      ? Icons.directions_walk
                      : _status == 'stopped'
                          ? Icons.accessibility_new
                          : Icons.not_accessible,
                  size: 100,
                ),
                Center(
                  child: Text(
                    _statusText,
                    style: _status == 'walking' || _status == 'stopped'
                        ? const TextStyle(fontSize: 30)
                        : const TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),
                _remainingTime == 0
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          maximumSize: const Size(300, 50),
                          minimumSize: const Size(300, 50),
                          backgroundColor: Colors.blue.withAlpha(100),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Qaytadan",
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.update_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (_isTracking) {
                            pauseTracking();
                          } else {
                            startTracking();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          maximumSize: const Size(300, 50),
                          minimumSize: const Size(300, 50),
                          backgroundColor: Colors.blue.withAlpha(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _isTracking
                                  ? "To'xtatish"
                                  : "Boshlash".toUpperCase(),
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            _isTracking
                                ? const Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  )
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
