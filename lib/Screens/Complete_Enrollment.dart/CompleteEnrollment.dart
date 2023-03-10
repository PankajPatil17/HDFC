// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/Complete_Enrollment.dart/Employee.dart';
import 'package:hdfc_bank/Screens/Complete_Enrollment.dart/Members.dart';
import 'package:hdfc_bank/Screens/Complete_Enrollment.dart/Top_Policies.dart';
import 'package:sizer/sizer.dart';

class CompleteEnroll extends StatefulWidget {
  const CompleteEnroll({super.key});

  @override
  State<CompleteEnroll> createState() => _CompleteEnrollState();
}

class _CompleteEnrollState extends State<CompleteEnroll> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            changeTab = 'employee';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              color: Color(0xffFFF8F5),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: commonboxshadow,
                              border: Border.all(
                                  width: 0.5,
                                  color: changeTab == 'employee'
                                      ? mainBlue
                                      : Colors.transparent)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                  'assets/Images/Employee-Details.svg'),
                              Text(
                                'Employee\nDetails',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            changeTab = 'members';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              color: Color(0xffFFF8F5),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: commonboxshadow,
                              border: Border.all(
                                  width: 0.5,
                                  color: changeTab == 'members'
                                      ? mainBlue
                                      : Colors.transparent)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                  'assets/Images/Members-Covered.svg'),
                              Text(
                                'Members\nCovered',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            changeTab = 'topup';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              color: Color(0xffFFF8F5),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: commonboxshadow,
                              border: Border.all(
                                  width: 0.5,
                                  color: changeTab == 'topup'
                                      ? mainBlue
                                      : Colors.transparent)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                  'assets/Images/Top-up-Policies.svg'),
                              Text(
                                'Top up\nPolicies',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  changeTab == 'employee'
                      ? EmployeedetailsScreen()
                      : changeTab == 'members'
                          ? Members()
                          : TopPolicies()
                ],
              ),
            ),
          )),
          CommonBottomBar(changetabcolor: '')
        ],
      )),
    );
  }
}
