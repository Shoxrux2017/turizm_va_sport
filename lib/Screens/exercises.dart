import 'package:flutter/material.dart';

class Exercises extends StatefulWidget {
  const Exercises({
    super.key,
  });

  @override
  State<Exercises> createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Exercise"),
    ));
  }
}
