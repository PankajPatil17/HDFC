// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/DownloadForms.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/IntimateClaim.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MembersCoverd.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MyCoverage.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MyclaimStatus.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/NetworkHospital.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/ShareYourDocuments.dart';
import 'package:sizer/sizer.dart';

class CompleteEnroll extends StatefulWidget {
  const CompleteEnroll({super.key});

  @override
  State<CompleteEnroll> createState() => _CompleteEnrollState();
}

class _CompleteEnrollState extends State<CompleteEnroll> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController EMPNum = TextEditingController();
  var changeTab = 'employee';
  var changetabcolor;
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                BackButton(),
                Image.asset(
                  'assets/Images/Hdfc_Logo.png',
                  height: 5.h,
                  width: 5.h,
                ),
                Spacer(),
                SvgPicture.asset('assets/Images/Notification.svg'),
              ],
            ),
          )),
          preferredSize: Size(100.h, 20.h)),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            width: 100.h,
            padding: EdgeInsets.all(1.5.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.h,
                    margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: commonboxshadow,
                        color: Color(0xffFFF8F5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextNunito(
                          label: 'Group Mediclaim Policy',
                          colorT: Colors.black,
                          fontw8: FontWeight.w400,
                          size: 12.sp,
                        ),
                        CommonTextNunito(
                          label: 'Sum Insured - 500000',
                          colorT: Colors.black,
                          fontw8: FontWeight.w400,
                          size: 12.sp,
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: commonboxshadow,
                            border: Border.all(width: 0.5, color: mainBlue)),
                      ),
                    ],
                  ),
                  HeaderText(titleLabel: 'Employee Name'),
                  Container(
                    decoration: BoxDeco(),
                    width: 100.w,
                    margin: EdgeInsets.symmetric(horizontal: 0.2.h),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Name';
                        } else if (val.length < 2) {
                          return "Please enter Name";
                        }
                        return null;
                      },
                      controller: name,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        hintText: 'Enter Name',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                  HeaderText(titleLabel: 'Email'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.2.h),
                    decoration: BoxDeco(),
                    width: 100.w,
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter your Email';
                        } else if (val.length < 2) {
                          return "Please Enter your Email";
                        }
                        return null;
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                  HeaderText(titleLabel: 'Employee Number'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.2.h),
                    decoration: BoxDeco(),
                    width: 100.w,
                    child: TextFormField(
                      maxLength: 20,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'The Employee Number field is required';
                        } else if (v.length != 20) {
                          return 'The Employee Number field is not in the correct format';
                        }
                        return null;
                      },
                      controller: EMPNum,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        hintText: 'Enter Employee Number',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                  HeaderText(titleLabel: 'Mobile Number'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.2.h),
                    decoration: BoxDeco(),
                    width: 100.w,
                    child: TextFormField(
                      maxLength: 10,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'The Mobile Number field is required';
                        } else if (v.length != 10) {
                          return 'The Mobile Number field is not in the correct format';
                        }
                        return null;
                      },
                      controller: EMPNum,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        hintText: 'Enter Mobile Number',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
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
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          CommonBottomBar(changetabcolor: '')
        ],
      )),
    );
  }

  //header Text
  HeaderText({titleLabel}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, top: 2.2.h),
      child: CommonTextNunito(
        label: titleLabel,
        colorT: Color(0xff313131),
        fontw8: FontWeight.w500,
        size: 12.sp,
      ),
    );
  }

  //commonDecoration
  BoxDeco() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 2),
              color: Colors.red.shade100)
        ]);
  }
}
