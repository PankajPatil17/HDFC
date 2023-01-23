import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/HomePage.dart';
import 'package:hdfc_bank/main.dart';
import 'package:sizer/sizer.dart';

class TopPolicies extends StatefulWidget {
  const TopPolicies({super.key});

  @override
  State<TopPolicies> createState() => _TopPoliciesState();
}

class _TopPoliciesState extends State<TopPolicies> {
  int val = -1;
  String? one;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please select the suitable options',
            style: TextStyle(
                color: Color(0xffb2b2b2),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 11.sp),
          ),
          Container(
            padding: EdgeInsets.all(1.5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(1.h),
                  width: 100.h,
                  margin: EdgeInsets.only(bottom: 2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: commonboxshadow,
                      color: pWhite),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = 1;
                            one = "300000";
                          });
                        },
                        activeColor: Color(0xff4BC4F9),
                      ),
                      Expanded(
                        child: Text(
                          "Sum Insured = 3,00,000 INR (w/o GST) Premium = 500 INR",
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff575757),
                              fontSize: 10.sp,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100.h,
                  padding: EdgeInsets.all(1.h),
                  margin: EdgeInsets.only(bottom: 7.2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: commonboxshadow,
                      color: pWhite),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = 2;
                            one = "00000";
                          });
                        },
                        activeColor: Color(0xff4BC4F9),
                      ),
                      Expanded(
                        child: Text(
                          "Sum Insured = 3,00,000 INR (w/o GST) = 800 INR",
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff575757),
                              fontSize: 10.sp,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 12.h,
                      height: 5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 0.5, color: mainBlue)),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(HomePage());
                          },
                          child: CommonTextNunito(
                            colorT: Colors.black,
                            label: 'Back',
                            size: 11.sp,
                            fontw8: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.snackbar(
                            'Success', 'Your Request Send Successfully');
                        Get.to(HomePage());
                      },
                      child: Container(
                        width: 12.h,
                        height: 5.h,
                        decoration: BoxDecoration(
                            color: mainBlue,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 0.5, color: mainBlue)),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(HomePage());
                            },
                            child: CommonTextNunito(
                              colorT: Colors.white,
                              label: 'Submit',
                              size: 11.sp,
                              fontw8: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
