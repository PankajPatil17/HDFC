import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FileterAlertFab extends StatefulWidget {
  const FileterAlertFab({super.key});

  @override
  State<FileterAlertFab> createState() => _FileterAlertFabState();
}

class _FileterAlertFabState extends State<FileterAlertFab> {
  String? sum;
  String? Tenure;
  String? Insurance;
  List sumarr = ['20 Lakh'];
  List Tenurerr = ['2 year'];
  List Insurancearr = ['HDFC Ergo'];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 44.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextNunito(
              label: 'Filter',
              fontw8: FontWeight.w700,
              size: 13.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Divider(
                color: Color(0xff4BC4F9),
                thickness: 0.8,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonHeader(headTitle: 'Sum Insured'),
                Container(
                  width: 38.w,
                  padding: EdgeInsets.all(1.4.h),
                  decoration: BoxDecoration(
                      color: pWhite,
                      boxShadow: commonboxshadowBlue,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: DropdownButton(
                      iconSize: 3.h,
                      iconEnabledColor: Color(0xff4BC4F9),
                      iconDisabledColor: Color(0xff4BC4F9),
                      underline: Container(
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: Text(
                        "Sum Insured",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                      value: sum,
                      items: sumarr.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item.toString(),
                            child: Text(
                              item,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          sum = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonHeader(headTitle: 'Tenure'),
                  Container(
                    width: 38.w,
                    padding: EdgeInsets.all(1.4.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: commonboxshadowBlue,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: DropdownButton(
                        iconSize: 3.h,
                        iconEnabledColor: Color(0xff4BC4F9),
                        iconDisabledColor: Color(0xff4BC4F9),
                        underline: Container(
                          color: Colors.white,
                        ),
                        focusColor: Colors.white,
                        menuMaxHeight: 300.0,
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          "Tenure",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              overflow: TextOverflow.ellipsis),
                        ),
                        value: Tenure,
                        items: Tenurerr.map((item) {
                          return DropdownMenuItem(
                              enabled: true,
                              value: item.toString(),
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    overflow: TextOverflow.ellipsis),
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Tenure = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonHeader(headTitle: 'Insurance\nCompanies'),
                Container(
                  width: 38.w,
                  padding: EdgeInsets.all(1.4.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: commonboxshadowBlue,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: DropdownButton(
                      iconSize: 3.h,
                      iconEnabledColor: Color(0xff4BC4F9),
                      iconDisabledColor: Color(0xff4BC4F9),
                      underline: Container(
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: Text(
                        "Insurance Companies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                      value: Insurance,
                      items: Insurancearr.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item.toString(),
                            child: Text(
                              item,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          Insurance = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.8.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff4BC4F9),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: CommonTextNunito(
                      label: 'Apply',
                      colorT: Colors.black,
                      fontw8: FontWeight.w600,
                      size: 10.sp,
                      maxline: 1,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.8.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff4BC4F9),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: CommonTextNunito(
                        label: 'Cancel',
                        colorT: Colors.black,
                        fontw8: FontWeight.w600,
                        size: 10.sp,
                        maxline: 1,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  commonHeader({headTitle}) {
    return CommonTextNunito(
      label: headTitle,
      fontw8: FontWeight.w500,
      size: 12.sp,
    );
  }
}
