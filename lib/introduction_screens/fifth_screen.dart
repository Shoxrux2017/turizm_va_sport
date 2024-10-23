import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_va_turizm/introduction_screens/natija_screen.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  var answersForBoy = [7, 11, 13, 16, 18];

  var answersForGirl = [3, 5, 6, 7, 9];

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
    await prefs.setInt('q3', _selectedValue!);
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
                  "Yerga tayangan holatda qo‘llarni bukib yozish (marta)",
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
                          title: Text(
                              "${(answersForBoy[i - 1]).toString()} marta"),
                          leading: Radio(
                            value: i,
                            groupValue: _selectedValue,
                            onChanged: (int? value) => selectedValue(value),
                          ),
                        )
                      : ListTile(
                          title: Text(
                              "${(answersForGirl[i - 1]).toString()} marta"),
                          leading: Radio(
                            value: i,
                            groupValue: _selectedValue,
                            onChanged: (int? value) => selectedValue(value),
                          ),
                        ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.to(const NatijaScreen()),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.blue[300]),
                  ),
                  child: const Text(
                    "Aniqlash",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
