import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_va_turizm/constant.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedGender = "notselected";
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cmHeightController = TextEditingController();
  TextEditingController _ftHeightController = TextEditingController();
  TextEditingController _inHeightController = TextEditingController();
  TextEditingController _lbsWeightController = TextEditingController();
  TextEditingController _kgsWeightController = TextEditingController();
  List<String> heightUnits = ['cm', 'ft.in'];
  List<String> weightUnits = ['lbs', 'kgs'];
  String selectedHeightUnit = 'cm';
  String selectedWeightUnit = 'lbs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Healthy',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.none,
                        fontSize: ScreenUtil().setSp(48.0),
                        fontFamily: 'RubikBold',
                      ),
                    ),
                    TextSpan(
                      text: 'Hub',
                      style: TextStyle(
                        color: AppColors.redColor,
                        decoration: TextDecoration.none,
                        fontSize: ScreenUtil().setSp(48.0),
                        fontFamily: 'RubikBold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //freeSPACE
            selectedGender == "notselected"
                ? SizedBox(
                    height: 134.h,
                  )
                : SizedBox(
                    height: 40.h,
                  ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                selectedGender == "notselected"
                    ? Image.asset(
                        'assets/images/questionmark.png',
                        width: 227.w,
                        height: 230.h,
                      )
                    : selectedGender == 'female'
                        ? _getFemaleImage()
                        : _getMaleImage(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Gender
                    Text(
                      "Gender",
                      style: TextStyle(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.none,
                        fontSize: ScreenUtil().setSp(24.0),
                        fontFamily: 'RubikBold',
                      ),
                    ),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        height: 52.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'male';
                                });
                              },
                              child: Container(
                                height: 52.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                  color: selectedGender == 'male'
                                      ? Colors.blue
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.male,
                                    color: selectedGender == 'male'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'female';
                                });
                              },
                              child: Container(
                                height: 52.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    ),
                                    color: selectedGender == 'female'
                                        ? Colors.pink
                                        : Colors.white),
                                child: Center(
                                  child: Icon(
                                    Icons.female,
                                    color: selectedGender == 'female'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //freeSPACE
                    SizedBox(
                      height: 20.h,
                    ),

                    //Age
                    Text(
                      "Age",
                      style: TextStyle(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.none,
                        fontSize: ScreenUtil().setSp(24.0),
                        fontFamily: 'RubikBold',
                      ),
                    ),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        height: 52.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.1.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.w),
                            border: InputBorder.none,
                            hintText: "Age",
                            counterText: "",
                          ),
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        ),
                      ),
                    ),

                    //freeSPACE
                    SizedBox(
                      height: 20.h,
                    ),

                    //Height
                    Row(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            color: AppColors.blueColor,
                            decoration: TextDecoration.none,
                            fontSize: ScreenUtil().setSp(24.0),
                            fontFamily: 'RubikBold',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: DropdownButton<String>(
                            value: selectedHeightUnit,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedHeightUnit = newValue!;
                              });
                            },
                            items: heightUnits
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: ScreenUtil().setSp(20.0),
                                    fontFamily: 'RubikBold',
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    selectedHeightUnit == "cm"
                        ? Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 52.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.1.w,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10.w),
                                  border: InputBorder.none,
                                  hintText: "Cm",
                                  counterText: "",
                                ),
                                controller: _cmHeightController,
                                keyboardType: TextInputType.number,
                                maxLength: 5,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  height: 52.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1.w,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10.w),
                                      border: InputBorder.none,
                                      hintText: "Ft",
                                      counterText: "",
                                    ),
                                    controller: _ftHeightController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 2,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  height: 52.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1.w,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10.w),
                                      border: InputBorder.none,
                                      hintText: "In",
                                      counterText: "",
                                    ),
                                    controller: _inHeightController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                  ),
                                ),
                              ),
                            ],
                          ),

                    //freeSPACE
                    SizedBox(
                      height: 20.h,
                    ),

                    //Weight
                    Row(
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: AppColors.blueColor,
                            decoration: TextDecoration.none,
                            fontSize: ScreenUtil().setSp(24.0),
                            fontFamily: 'RubikBold',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: DropdownButton<String>(
                            value: selectedWeightUnit,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedWeightUnit = newValue!;
                              });
                            },
                            items: weightUnits
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: ScreenUtil().setSp(20.0),
                                    fontFamily: 'RubikBold',
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        height: 52.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.1.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            if (value.length > 5) {
                              // Limit the length to 5 characters
                              _lbsWeightController.text = value.substring(0, 5);
                              _kgsWeightController.text = value.substring(0, 5);
                            }
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.w),
                            border: InputBorder.none,
                            hintText:
                                selectedWeightUnit == "lbs" ? "Lbs" : "Kgs",
                            counterText: "",
                          ),
                          controller: selectedWeightUnit == "lbs"
                              ? _lbsWeightController
                              : _kgsWeightController,
                          keyboardType: TextInputType.number,
                          maxLength: 5,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            //freeSPACE
            selectedGender == "notselected"
                ? SizedBox(
                    height: 142.h,
                  )
                : SizedBox(
                    height: 48.h,
                  ),

            //Button
            // ElevatedButton(
            //   style: ButtonStyle(
            //       backgroundColor:
            //           const WidgetStatePropertyAll(AppColors.blueColor),
            //       minimumSize: const WidgetStatePropertyAll(
            //         Size(300, 55),
            //       ),
            //       shape: WidgetStatePropertyAll(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //       )),
            //   onPressed: () {
            //     if (selectedHeightUnit == "cm" && selectedWeightUnit == "lbs") {
            //       onPressedCheckHealth(
            //           selectedGender,
            //           _ageController.text,
            //           _cmHeightController.text,
            //           _lbsWeightController.text,
            //           selectedHeightUnit,
            //           selectedWeightUnit);
            //     } else if (selectedHeightUnit == "ft.in" &&
            //         selectedWeightUnit == "lbs") {
            //       onPressedCheckHealth(
            //           selectedGender,
            //           _ageController.text,
            //           "${_ftHeightController.text}.${_inHeightController.text}",
            //           _lbsWeightController.text,
            //           selectedHeightUnit,
            //           selectedWeightUnit);
            //     } else if (selectedHeightUnit == "cm" &&
            //         selectedWeightUnit == "kgs") {
            //       onPressedCheckHealth(
            //           selectedGender,
            //           _ageController.text,
            //           _cmHeightController.text,
            //           _kgsWeightController.text,
            //           selectedHeightUnit,
            //           selectedWeightUnit);
            //     } else if (selectedHeightUnit == "ft.in" &&
            //         selectedWeightUnit == "kgs") {
            //       onPressedCheckHealth(
            //           selectedGender,
            //           _ageController.text,
            //           "${_ftHeightController.text}.${_inHeightController.text}",
            //           _kgsWeightController.text,
            //           selectedHeightUnit,
            //           selectedWeightUnit);
            //     }
            //   },
            //   child: Text(
            //     "Check Health",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: ScreenUtil().setSp(26.0),
            //       fontFamily: 'RubikBold',
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _getFemaleImage() {
    int age = int.tryParse(_ageController.text) ?? 0;
    return age > 60
        ? Image.asset(
            'assets/images/old_lady.png',
            width: 227.w,
            height: 630.h,
          )
        : Image.asset(
            'assets/images/young_girl.png',
            width: 227.w,
            height: 630.h,
          );
  }

  Widget _getMaleImage() {
    int age = int.tryParse(_ageController.text) ?? 0;
    return age > 60
        ? Image.asset(
            'assets/images/old_man.png',
            width: 227.w,
            height: 630.h,
          )
        : Image.asset(
            'assets/images/young_boy.png',
            width: 227.w,
            height: 630.h,
          );
  }
}
