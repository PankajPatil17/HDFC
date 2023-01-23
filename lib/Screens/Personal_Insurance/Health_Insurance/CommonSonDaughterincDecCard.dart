import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonSonDaughterincDecCard extends StatefulWidget {
  final checktitle;

  const CommonSonDaughterincDecCard({super.key, required this.checktitle});

  @override
  State<CommonSonDaughterincDecCard> createState() =>
      _CommonSonDaughterincDecCardState();
}

class _CommonSonDaughterincDecCardState
    extends State<CommonSonDaughterincDecCard> {
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());

  bool checkUnchecktab = false;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.2.h,
      width: 100.w,
      padding: EdgeInsets.all(1.5.h),
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
          color: pWhite,
          boxShadow: commonboxshadowBlue,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          checkUnchecktab
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      checkUnchecktab = !checkUnchecktab;
                      if (checkUnchecktab == false) {
                        num = 0;
                        if (widget.checktitle == 'Son') {
                          HealthInsurerController.son = num;
                        } else {
                          HealthInsurerController.Daughter = num;
                        }
                      }
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/Images/checkbox_HealthInsure.svg',
                    height: 3.h,
                    width: 3.h,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      checkUnchecktab = !checkUnchecktab;
                      if (checkUnchecktab == false) {
                        num = 0;
                        if (widget.checktitle == 'Son') {
                          HealthInsurerController.son = num;
                        } else {
                          HealthInsurerController.Daughter = num;
                        }
                      }
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/Images/uncheckbox_HealthInsure.svg',
                    height: 3.h,
                    width: 3.h,
                  ),
                ),
          SizedBox(
            width: 1.5.h,
          ),
          CommonTextNunito(
            label: widget.checktitle.toString(),
            colorT: Colors.black,
            fontw8: FontWeight.w500,
            size: 11.sp,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                if (checkUnchecktab == true) {
                  if (num > 0) {
                    num--;
                  }
                  if (widget.checktitle == 'Son') {
                    HealthInsurerController.son = num;
                  } else {
                    HealthInsurerController.Daughter = num;
                  }
                }
              });
            },
            child: Container(
              padding: EdgeInsets.all(0.3.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: commonboxshadowBlue,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.remove,
                size: 2.8.h,
                color: Color(0xff4BC4F9),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.2.h),
            child: CommonTextNunito(
              label: num.toString(),
              fontw8: FontWeight.w500,
              size: 12.sp,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (checkUnchecktab == true) {
                  num++;
                }
              });
              if (widget.checktitle == 'Son') {
                HealthInsurerController.son = num;
              } else {
                HealthInsurerController.Daughter = num;
              }
            },
            child: Container(
              padding: EdgeInsets.all(0.3.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: commonboxshadowBlue,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                size: 2.8.h,
                color: Color(0xff4BC4F9),
              ),
            ),
          )
        ],
      ),
    );
  }
}
