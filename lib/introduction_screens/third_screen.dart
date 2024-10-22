import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List answersForBoy = [5.3, 5.8, 6.2, 6.8, 7.3];
  List answersForGirl = [5.9, 6.4, 6.9, 7.3, 8.2];
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  "30 m. ga yugurish",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: const Text("5.3 (Yuqori)"),
                  leading: Radio(
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('5.8 (Yuqoridan past)'),
                  leading: Radio(
                    value: 2,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("6.2 (O'rta)"),
                  leading: Radio(
                    value: 3,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("6.8 (O'rtadan past)"),
                  leading: Radio(
                    value: 3,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('7.3 (Past)'),
                  leading: Radio(
                    value: 3,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
