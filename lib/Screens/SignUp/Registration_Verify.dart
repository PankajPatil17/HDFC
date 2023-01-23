import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Controller/DeviceInfoNotifiController.dart';
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';
import 'package:slide_countdown/slide_countdown.dart';

class Registration_Verify extends StatefulWidget {
  final mobNum;
  final deviceid;
  final email;
  final userid;

  const Registration_Verify(
      {super.key, this.mobNum, this.deviceid, this.email, this.userid});

  @override
  State<Registration_Verify> createState() => _Registration_VerifyState();
}

class _Registration_VerifyState extends State<Registration_Verify> {
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
    super.initState();
  }

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
                margin: EdgeInsets.only(top: 8.5.h, bottom: 1.5.h),
                // height: 20.h,
                // width: 100.h,
                child: SvgPicture.asset(
                  'assets/Images/Login_Image.svg',
                  fit: BoxFit.cover,
                )),
            CommonText(
              label: 'Welcome to OdinAssure',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Color(0xff338EC0),
                  fontFamily: 'Inter'),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            CommonText(
              label: 'OTP Verification',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Color(0xff338EC0),
                  fontFamily: 'Inter'),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5.h),
              child: TextFormField(
                maxLength: 6,
                autofillHints: [AutofillHints.oneTimeCode],
                enableSuggestions: true,
                controller: OtpController,
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
            GestureDetector(
              onTap: () async {
                String? fcmKey = await getFcmToken();
                print('FCM Key : $fcmKey');
                setState(() {
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
                  SignUpcontroller.RegistrationVerifyOTP(
                      mobNum: widget.mobNum,
                      deviceid: widget.deviceid,
                      otp: OtpController.text,
                      fcmkey: 'fcmKey',
                      email: widget.email,
                      userid: widget.userid);
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
                    'VERIFY',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.cyan,
                        letterSpacing: 1,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  label: 'Didn\'t receive the verification OTP? ',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Inter'),
                ),
                changetimer == 'resend'
                    ? GestureDetector(
                        onTap: () async {
                          String? fcmKey = await getFcmToken();
                          print('FCM Key : $fcmKey');
                          DeviceFunctcontroller.getId();
                          Future.delayed(Duration(milliseconds: 100), () {
                            SignUpcontroller.RegistrationVerifyOTP(
                                mobNum: widget.mobNum,
                                email: widget.email,
                                userid: widget.userid,
                                fcmkey: 'fcmKey',
                                otp: OtpController.text,
                                deviceid: DeviceFunctcontroller.deviceId);
                          });
                        },
                        child: CommonText(
                          label: 'Resend again',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.cyan.shade600,
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
                                color: Colors.black,
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
          ]),
        ),
      )),
    );
  }
}
