import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/DeviceInfoNotifiController.dart';
import 'package:odin/Controller/HomePageController.dart';
import 'package:odin/Controller/SignUpController.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:odin/Generic/Constant/variables.dart';
import 'package:odin/Screens/OnBoarding/WebViewScreen.dart';
import 'package:odin/Screens/SignUp/LoginScreen.dart';
import 'package:sizer/sizer.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  TextEditingController Fullname = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Mobilenumber = TextEditingController();
  var SignUpcontroller = Get.put(SignUpController());
  var DeviceFunctcontroller = Get.put(DeviceInfoNotifiController());
  var HomeController = Get.put(HomePageController());
  bool checkvalue = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: 100.h,
        width: 100.h,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [SvgPicture.asset('assets/Images/bg1.svg')]),
                    Center(
                      child: CommonText(
                        label: 'Welcome to OdinAssure',
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff338EC0),
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: CommonText(
                        label: 'Corporate Employee Registration',
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 3.h),
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
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                              contentPadding: EdgeInsets.all(2.h),
                              fillColor: Colors.grey.shade200,
                              filled: true),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16, right: 16, bottom: 3.h),
                      child: Material(
                        elevation: 3.0,
                        shadowColor: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                        child: TextFormField(
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'The Email field is required';
                            }
                            return null;
                          },
                          controller: Email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabled: true,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                              contentPadding: EdgeInsets.all(2.h),
                              fillColor: Colors.grey.shade200,
                              filled: true),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16, right: 16, bottom: 1.h),
                      child: Material(
                        elevation: 3.0,
                        shadowColor: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
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
                          controller: Mobilenumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabled: true,
                              hintText: 'Mobile Number',
                              counterText: '',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                              contentPadding: EdgeInsets.all(2.h),
                              fillColor: Colors.grey.shade200,
                              filled: true),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Color.fromARGB(255, 4, 79, 18),
                          fillColor:
                              MaterialStateProperty.all(Color(0xff338EC0)),
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
                                          fontFamily: 'Poppins',
                                          color: Color(0xff338EC0),
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
                                          fontFamily: 'Poppins',
                                          color: Color(0xff338EC0),
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
                        String? fcmKey = await getFcmToken();

                        setState(() {
                          if (formKey.currentState!.validate()) {
                            if (checkvalue == true) {
                              DeviceFunctcontroller.getId();
                              Future.delayed(Duration(milliseconds: 100), () {
                                SignUpcontroller.SignUpRegiFunction(
                                    fname: Fullname.text,
                                    email: Email.text,
                                    fcmkey: fcmKey,
                                    mobNum: Mobilenumber.text,
                                    deviceid: DeviceFunctcontroller.deviceId);
                                HomeController.Usermobilenumber =
                                    Mobilenumber.text;
                              });
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
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          margin: EdgeInsets.symmetric(vertical: 3.h),
                          width: 22.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xff338EC0)),
                          ),
                          child: Center(
                            child: Text(
                              'Create Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Center(
                        child: Text(
                          'Already have account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/Images/bg2.svg'),
                ],
              )
            ]),
          ),
        ),
      )),
    );
  }
}
