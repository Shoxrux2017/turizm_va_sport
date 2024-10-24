import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  var answersForBoy = [7.3, 6.8, 6.2, 5.8, 5.3];

  var answersForGirl = [8.2, 7.3, 6.9, 6.4, 5.9];

  int? _selectedValue;
  String? selectedGender;

  Future<void> initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedGender = prefs.getString('selectingGender');
    setState(() {});
  }

  Future<void> selectedValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _selectedValue = value!;
    });

    await prefs.setInt('q1', _selectedValue!);
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

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
                for (var i = 1; i < 6; i++)
                  selectedGender == "male"
                      ? ListTile(
                          title: Text("${(answersForBoy[i - 1]).toString()} s"),
                          leading: Radio(
                            value: i,
                            groupValue: _selectedValue,
                            onChanged: (int? value) => selectedValue(value),
                          ),
                        )
                      : ListTile(
                          title:
                              Text("${(answersForGirl[i - 1]).toString()} s"),
                          leading: Radio(
                            value: i,
                            groupValue: _selectedValue,
                            onChanged: (int? value) => selectedValue(value),
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
