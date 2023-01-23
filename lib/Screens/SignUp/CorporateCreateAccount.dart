import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/DeviceInfoNotifiController.dart';
import 'package:odin/Controller/SignUpController.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:odin/Screens/OnBoarding/WebViewScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CorporateCreateAccount extends StatefulWidget {
  final corpId;

  const CorporateCreateAccount({super.key, required this.corpId});
  @override
  State<CorporateCreateAccount> createState() => _CorporateCreateAccountState();
}

class _CorporateCreateAccountState extends State<CorporateCreateAccount> {
  var DeviceFunctcontroller = Get.put(DeviceInfoNotifiController());
  var SignUpcontroller = Get.put(SignUpController());
  TextEditingController officialEmail = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController corpF1ReadOnly = TextEditingController();
  TextEditingController corpF2ReadOnly = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: 100.h,
        width: 100.h,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SvgPicture.asset('assets/Images/bg1.svg')]),
              SizedBox(
                height: 4.h,
              ),
              CommonText(
                label: 'Corporate Employee Registration',
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextFormField(
                  controller: corpF1ReadOnly,
                  readOnly: true,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: SignUpcontroller.CorCropoName.toString(),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                      contentPadding: EdgeInsets.all(2.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: corpF2ReadOnly,
                  readOnly: true,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: SignUpcontroller.CorFullName,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                      contentPadding: EdgeInsets.all(2.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2.h),
                child: TextFormField(
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'The Email is required';
                    }
                    return null;
                  },
                  controller: officialEmail,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: 'Enter Official Email',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black26,
                          fontFamily: 'Poppins'),
                      contentPadding: EdgeInsets.all(2.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 2.h),
                child: TextFormField(
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'The Mobile Number field is required';
                    } else if (v.length != 10) {
                      return 'The Mobile Number field is not in the correct format';
                    }
                    return null;
                  },
                  controller: mobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: 'Enter Mobile Number',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black26,
                          fontFamily: 'Poppins'),
                      contentPadding: EdgeInsets.all(2.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Color.fromARGB(255, 4, 79, 18),
                    fillColor: MaterialStateProperty.all(Colors.cyan),
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
                              textStyle: labelTextStyleBlackReguler14,
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
                                    color: Colors.blue,
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
                                    color: Colors.blue,
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
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Get.back();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      margin: EdgeInsets.only(bottom: 2.5.h),
                      width: 14.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.cyan),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'BACK',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.cyan,
                              letterSpacing: 1,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (checkvalue == true) {
                          LoginLoader();
                          await DeviceFunctcontroller.getId();
                          await Future.delayed(Duration(milliseconds: 100), () {
                            SignUpcontroller.CorporateSendOtp(
                                mobile: mobile.text,
                                email_id: officialEmail.text,
                                userid: widget.corpId,
                                deviceid: DeviceFunctcontroller.deviceId);
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
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      margin: EdgeInsets.only(bottom: 2.5.h),
                      width: 14.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.cyan),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.cyan,
                              letterSpacing: 1,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ],
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
