// ignore_for_file: unused_local_variable

// import 'package:odin/Controller/Phonselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/DeviceInfoNotifiController.dart';
import 'package:hdfc_bank/Controller/HomePageController.dart';
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Screens/OnBoarding/WebViewScreen.dart';
import 'package:hdfc_bank/Screens/SignUp/CorporateEmployeeSignUp.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var SignUpcontroller = Get.put(SignUpController());
  var HomeController = Get.put(HomePageController());
  var DeviceFunctcontroller = Get.put(DeviceInfoNotifiController());
  TextEditingController mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkvalue = false;
  // @override
  // void initState() {
  //   Future.delayed(
  //       Duration(
  //         seconds: 2,
  //       ), () async {
  // print('hghhg${await Phoneselectorhint.hint}');
  //     mobileController.text =
  //         '${await Phoneselectorhint.hint}'.toString().replaceRange(0, 3, '');
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Container(
          height: 100.h,
          width: 100.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 2.h, bottom: 1.5.h),
                    // height: 20.h,
                    // width: 100.h,
                    child: SvgPicture.asset(
                      'assets/Images/Login_Image.svg',
                      fit: BoxFit.cover,
                      height: 35.h,
                    )),
                Image.asset(
                  'assets/Images/Hdfc_Logo.png',
                  fit: BoxFit.cover,
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.8.h, bottom: 1.8.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CommonText(
                      label: 'Login',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Color(0xffD82A1B),
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.8.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CommonText(
                      label: 'Mobile number',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Material(
                    elevation: 3.0,
                    shadowColor: Colors.white,
                    child: TextFormField(
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'The Mobile Number field is required';
                        } else if (v.length != 10) {
                          return 'The Mobile Number field is not in the correct format';
                        }
                        return null;
                      },
                      maxLength: 10,
                      controller: mobileController,
                      enableSuggestions: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black26,
                              fontFamily: 'Inter'),
                          contentPadding: EdgeInsets.all(2.h),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.5),
                              borderRadius: BorderRadius.circular(6)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.5),
                              borderRadius: BorderRadius.circular(6)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.5),
                              borderRadius: BorderRadius.circular(6)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.5),
                              borderRadius: BorderRadius.circular(6)),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Color(0xffD82A1B),
                      fillColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 168, 162)),
                      value: checkvalue,
                      onChanged: (checkboxValue) {
                        setState(() {
                          checkvalue = checkboxValue ?? false;
                        });
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                label: 'I have read and accept the ',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Get.to(WebviewScreen(
                                        url:
                                            'https://odinassure.com/odin-terms-and-conditions',
                                        labelname: 'Terms & Condition'));
                                  });
                                },
                                child: Text(
                                  'Terms & Condition ',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 13,
                                      fontFamily: 'Inter',
                                      color: Color(0xffD82A1B),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                label: 'and ',
                                textStyle: labelTextStyleBlackReguler14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Get.to(WebviewScreen(
                                      url:
                                          'https://odinassure.com/odin-privacy-policy',
                                      labelname: 'Privacy Policy',
                                    ));
                                  });
                                },
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 13,
                                      fontFamily: 'Inter',
                                      color: Color(0xffD82A1B),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (checkvalue == true) {
                        LoginLoader();
                        await DeviceFunctcontroller.getId();
                        await SignUpcontroller.logInFunction(
                            mobNum: mobileController.text,
                            deviceid:
                                DeviceFunctcontroller.deviceId.toString());
                        HomeController.Usermobilenumber = mobileController.text;

                        SignUpcontroller.userstatusReg == 1
                            ? Fluttertoast.showToast(
                                msg: "Mobile Number Not Registered",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              )
                            : SizedBox.shrink();
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please accept conditions",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                    width: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xffD82A1B),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Don't have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Inter'),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Get.to(CorporateEmployeeSignUp());
                    });
                  },
                  child: Text(
                    "Create account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xffD82A1B),
                        fontFamily: 'Inter'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  LoginLoader() {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.all(8),
          content: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(label: 'Please Wait'),
                SizedBox(
                  width: 1.5.h,
                ),
                CircularProgressIndicator(
                  color: Color(0xff2A8ABF),
                  strokeWidth: 2.75,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
