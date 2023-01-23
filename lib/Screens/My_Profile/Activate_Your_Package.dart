// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../Generic/Constant/variables.dart';

class ActivewellnesPackage extends StatefulWidget {
  const ActivewellnesPackage({super.key});

  @override
  State<ActivewellnesPackage> createState() => _ActivewellnesPackageState();
}

class _ActivewellnesPackageState extends State<ActivewellnesPackage> {
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();
  var SignUpcontroller = Get.put(SignUpController());

  var changeButton = '';

  Future ActiveWellnessPackageFunction() async {
    Map data = {
      "mobile": mobilenumber.text,
      "email_id": email.text,
      'otp': otp.text
    };
    var body = jsonEncode(data);
    final response =
        await http.post(Uri.parse('${BASE_URL}api/diagnostics/link_package'),
            headers: {
              "Content-type": "application/json",
              "Authorization": SignUpcontroller.currentUserToken
            },
            body: body);
    var decodedResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: decodedResponse['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.back();
    } else {
      Fluttertoast.showToast(
          msg: "Wrong OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future GenerateOTPSend() async {
    final response = await http.post(
        Uri.parse('${BASE_URL}login_register/generate_generic_otp'),
        body: {
          "mobile": mobilenumber.text,
          "email_id": email.text,
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        });
    var decodedResponse = json.decode(response.body);

    if (decodedResponse['status'] == 200) {
      Fluttertoast.showToast(
          msg: 'Message sent successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text(
      //         'Your Otp is - ${decodedResponse['otp_value']}',
      //         style: labelTextStyleBlackReguler16,
      //       ),
      //     );
      //   },
      // );
      setState(() {
        changeButton = 'otp';
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Something went wrong Please try again',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        changeButton = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Activate Your Wellness Package",
        style: labelTextStyleBlackReguler16,
      ),
      content: Container(
        height: 38.h,
        width: 100.h,
        child: Column(
          children: [
            Container(
              width: 100.h,
              height: 5.5.h,
              padding: EdgeInsets.only(left: 1.h, right: 1.h),
              margin: EdgeInsets.only(top: 1.h, bottom: 1.5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1.0, color: Color(0xffe4e4e4))),
              child: TextFormField(
                controller: mobilenumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mobile Number',
                    hintStyle: labelTextStyleGreyReguler14),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: CommonText(
                label: 'OR',
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins'),
              ),
            ),
            Container(
              width: 100.h,
              height: 5.5.h,
              padding: EdgeInsets.only(left: 1.h, right: 1.h),
              margin: EdgeInsets.only(bottom: 1.5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1.0, color: Color(0xffe4e4e4))),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email Address',
                    hintStyle: labelTextStyleGreyReguler14),
              ),
            ),
            Divider(color: Colors.black),
            Container(
              width: 100.h,
              height: 5.5.h,
              padding: EdgeInsets.only(left: 1.h, right: 1.h),
              margin: EdgeInsets.only(top: 1.h, bottom: 1.5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1.0, color: Color(0xffe4e4e4))),
              child: TextFormField(
                controller: otp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Otp',
                    hintStyle: labelTextStyleGreyReguler14),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                changeButton == 'otp'
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            ActiveWellnessPackageFunction();
                          });
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 12.h,
                          margin: EdgeInsets.only(top: 1.h, bottom: 1.5.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0XFF1ba8d3),
                                Color(0xFF39f1e0)
                              ]),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    color: Colors.black12,
                                    spreadRadius: 1)
                              ]),
                          child: CommonText(
                            label: 'Submit',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            GenerateOTPSend();
                          });
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 12.h,
                          margin: EdgeInsets.only(top: 1.h, bottom: 1.5.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0XFF1ba8d3),
                                Color(0xFF39f1e0)
                              ]),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    color: Colors.black12,
                                    spreadRadius: 1)
                              ]),
                          child: CommonText(
                            label: 'Send OTP',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Get.back();
                    });
                  },
                  child: Container(
                    height: 5.5.h,
                    width: 12.h,
                    margin: EdgeInsets.only(top: 1.h, bottom: 1.5.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0XFF1ba8d3), Color(0xFF39f1e0)]),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                              spreadRadius: 1)
                        ]),
                    child: CommonText(
                      label: 'Cancel',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
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
