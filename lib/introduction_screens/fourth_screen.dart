import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  var answersForBoy = [192, 201, 207, 213, 217];

  var answersForGirl = [148, 162, 166, 171, 177];

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
    await prefs.setInt('q2', _selectedValue!);
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
                  "Turgan joyidan uzunlikka sakrash (sm) ",
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
                          title:
                              Text("${(answersForBoy[i - 1]).toString()} sm"),
                          leading: Radio(
                            value: i,
                            groupValue: _selectedValue,
                            onChanged: (int? value) => selectedValue(value),
                          ),
                        )
                      : ListTile(
                          title:
                              Text("${(answersForGirl[i - 1]).toString()} sm"),
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
