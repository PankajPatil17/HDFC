import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/DeviceInfoNotifiController.dart';
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OtpVerify extends StatefulWidget {
  final mobNum;
  final deviceid;

  const OtpVerify({super.key, this.mobNum, this.deviceid});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  var SignUpcontroller = Get.put(SignUpController());
  var DeviceFunctcontroller = Get.put(DeviceInfoNotifiController());
  TextEditingController OtpController = TextEditingController();
  var changetimer = '';

  @override
  void initState() {
    Future.delayed(Duration(seconds: 59), () {
      setState(() {
        changetimer = 'resend';
      });
    });
    // otplisten();
    super.initState();
  }

  // otplisten() async {
  //   await SmsAutoFill().listenForCode;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: 100.h,
        width: 100.h,
        child: SingleChildScrollView(
          child: Column(children: [
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
              padding: EdgeInsets.only(left: 1.8.h, top: 2.5.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: CommonText(
                  label: 'OTP Verification',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Color(0xffD82A1B),
                      fontFamily: 'Inter'),
                ),
              ),
            ),

            // TextFieldPinAutoFill(
            //   currentCode: '000000',
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3.5.h),
              child: TextFormField(
                maxLength: 6,
                controller: OtpController,
                autofillHints: [AutofillHints.oneTimeCode],
                enableSuggestions: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    counterText: "",
                    hintText: 'Enter OTP',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black26,
                        fontFamily: 'Inter'),
                    contentPadding: EdgeInsets.all(2.h),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(6)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(6)),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  label: "Didn't receive OTP click on ",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontFamily: 'Inter'),
                ),
                changetimer == 'resend'
                    ? GestureDetector(
                        onTap: () {
                          DeviceFunctcontroller.getId();
                          Future.delayed(Duration(milliseconds: 100), () {
                            SignUpcontroller.logInFunction(
                                mobNum: widget.mobNum,
                                deviceid: DeviceFunctcontroller.deviceId);
                          });
                        },
                        child: CommonText(
                          label: 'Resend OTP ',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xffD82A1B),
                              fontFamily: 'Inter'),
                        ),
                      )
                    : Row(
                        children: [
                          CommonText(
                            label: 'Request in ',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffD82A1B),
                                fontFamily: 'Inter'),
                          ),
                          SlideCountdown(
                            padding: EdgeInsets.all(0),
                            textStyle: TextStyle(color: Colors.black),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            duration: const Duration(seconds: 60),
                          ),
                          CommonText(
                            label: ' Sec',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Inter'),
                          ),
                        ],
                      )
              ],
            ),
            GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Please Wait",
                        style: labelTextStyleBlackReguler16,
                      ),
                    );
                  },
                );
                SignUpcontroller.OtpVerifyFunction(
                  mobNum: widget.mobNum,
                  deviceid: widget.deviceid,
                  otp: OtpController.text,
                  fcmkey: '1',
                );
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
                    'Verify',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: Colors.black,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
