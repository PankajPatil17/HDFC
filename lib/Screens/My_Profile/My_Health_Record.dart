import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Screens/HomePage.dart';
import 'package:sizer/sizer.dart';

class MyHealthRecord extends StatefulWidget {
  const MyHealthRecord({super.key});

  @override
  State<MyHealthRecord> createState() => _MyHealthRecordState();
}

class _MyHealthRecordState extends State<MyHealthRecord> {
  TextEditingController Fullname = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController otherremarks = TextEditingController();
  TextEditingController bloodgroup = TextEditingController();
  String? gender;
  String? allergy;

  List genderList = [
    'Male',
    'Female',
  ];

  List allergyList = [
    'Alergy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pWhite,
      appBar: PreferredSize(
          child: SafeArea(
              child: Container(
            height: 7.h,
            width: 100.h,
            padding: EdgeInsets.only(right: 1.2.h),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(
                  color: Color(0xff2479ab),
                ),
                SvgPicture.asset(
                  'assets/Images/Odin_Logo.svg',
                  height: 3.h,
                  width: 3.h,
                ),
              ],
            ),
          )),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 100.h,
              padding: EdgeInsets.all(1.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 2.h),
                    decoration: BoxDecoration(
                        color: pWhite,
                        boxShadow: commonboxshadow,
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(width: 0.5, color: Color(0xffe4e4e4))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 5.h,
                          width: 100.h,
                          margin: EdgeInsets.only(bottom: 2.h),
                          padding: EdgeInsets.only(left: 2.h),
                          decoration: BoxDecoration(
                              color: Color(0xffD1EEFF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              )),
                          child: CommonText(
                            label: 'Health Record',
                            textStyle: labelTextStyleBlackReguler14,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Material(
                            elevation: 3.0,
                            shadowColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                            child: TextFormField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'The Full Name is required';
                                }
                                return null;
                              },
                              controller: Fullname,
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  enabled: true,
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: Colors.grey,
                                      fontFamily: 'Inter'),
                                  contentPadding: EdgeInsets.all(2.h),
                                  fillColor: pWhite,
                                  filled: true),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 1.5.h, bottom: 1.5.h, left: 2.h, right: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 19.h,
                                height: 6.h,
                                padding: EdgeInsets.only(
                                  left: 1.h,
                                ),
                                margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                                decoration: BoxDecoration(
                                    boxShadow: commonboxshadow,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1, color: Color(0xffe4e4e4))),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: labelTextStyleGreyReguler14,
                                    hintText: _selectedDate != null
                                        ? _selectedDate
                                            .toString()
                                            .replaceRange(11, 23, '')
                                        : 'Date Of Birth',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.calendar_today_rounded,
                                        color: Color(0xffb2b2b2),
                                        size: 2.3.h,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _presentDatePicker();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 6.h,
                                width: 19.h,
                                margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: commonboxshadow,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Color(0xffe4e4e4), width: 1.0)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 1.h, right: 1.h, top: 0.9.h),
                                  child: DropdownButton(
                                      focusColor: Colors.white,
                                      menuMaxHeight: 300.0,
                                      isExpanded: true,
                                      isDense: true,
                                      hint: CommonText(
                                        label: 'Select Gender',
                                        textStyle: labelTextStyleGreyReguler14,
                                      ),
                                      underline: Container(
                                        color: Colors.white,
                                      ),
                                      value: gender,
                                      items: genderList.map((item) {
                                        return DropdownMenuItem(
                                            enabled: true,
                                            onTap: () {},
                                            value: item.toString(),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ));
                                      }).toList(),
                                      onChanged: (String? _v) {
                                        setState(() {
                                          gender = _v!;
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 1.5.h, left: 2.h, right: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Material(
                                elevation: 3.0,
                                shadowColor: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(6),
                                child: SizedBox(
                                  width: 19.h,
                                  child: TextFormField(
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return 'The Blood Group is required';
                                      }
                                      return null;
                                    },
                                    controller: bloodgroup,
                                    decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabled: true,
                                        hintText: 'Blood Group',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                            color: Colors.grey,
                                            fontFamily: 'Inter'),
                                        contentPadding: EdgeInsets.all(2.h),
                                        fillColor: pWhite,
                                        filled: true),
                                  ),
                                ),
                              ),
                              Container(
                                height: 6.h,
                                width: 19.h,
                                margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: commonboxshadow,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Color(0xffe4e4e4), width: 1.0)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 1.h, right: 1.h, top: 0.9.h),
                                  child: DropdownButton(
                                      focusColor: Colors.white,
                                      menuMaxHeight: 300.0,
                                      isExpanded: true,
                                      isDense: true,
                                      hint: CommonText(
                                        label: 'Select',
                                        textStyle: labelTextStyleGreyReguler14,
                                      ),
                                      underline: Container(
                                        color: Colors.white,
                                      ),
                                      value: allergy,
                                      items: allergyList.map((item) {
                                        return DropdownMenuItem(
                                            enabled: true,
                                            onTap: () {},
                                            value: item.toString(),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ));
                                      }).toList(),
                                      onChanged: (String? _v) {
                                        setState(() {
                                          allergy = _v!;
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.h, right: 2.h, bottom: 1.5.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Material(
                                  elevation: 3.0,
                                  shadowColor: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(6),
                                  child: SizedBox(
                                    width: 19.h,
                                    child: TextFormField(
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'The height is required';
                                        }
                                        return null;
                                      },
                                      controller: height,
                                      decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabled: true,
                                          hintText: 'height',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              color: Colors.grey,
                                              fontFamily: 'Inter'),
                                          contentPadding: EdgeInsets.all(2.h),
                                          fillColor: pWhite,
                                          filled: true),
                                    ),
                                  ),
                                ),
                                Material(
                                  elevation: 3.0,
                                  shadowColor: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(6),
                                  child: SizedBox(
                                    width: 19.h,
                                    child: TextFormField(
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'The Weight is required';
                                        }
                                        return null;
                                      },
                                      controller: weight,
                                      decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabled: true,
                                          hintText: 'Weight',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              color: Colors.grey,
                                              fontFamily: 'Inter'),
                                          contentPadding: EdgeInsets.all(2.h),
                                          fillColor: pWhite,
                                          filled: true),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2.h, right: 2.h, bottom: 2.h),
                          child: Material(
                            elevation: 3.0,
                            shadowColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                            child: TextFormField(
                              controller: otherremarks,
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  enabled: true,
                                  hintText: 'Other Remarks',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: Colors.grey,
                                      fontFamily: 'Inter'),
                                  contentPadding: EdgeInsets.all(2.h),
                                  fillColor: pWhite,
                                  filled: true),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(HomePage(), transition: transitoineffect);
                              Get.snackbar('Success',
                                  'Health Record Added Successfully');
                            },
                            child: Container(
                              height: 5.5.h,
                              width: 12.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff0075B8),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5, color: Color(0xffe4e4e4))),
                              child: Center(
                                child: CommonText(
                                  label: 'Submit',
                                  textStyle: labelTextStyleWhiteReguler14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CommonBottomBar(changetabcolor: '')
        ],
      )),
    );
  }

  DateTime? _selectedDate;
  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2050))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
