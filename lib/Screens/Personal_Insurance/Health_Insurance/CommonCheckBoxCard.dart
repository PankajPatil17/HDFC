import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonCheckBoxCard extends StatefulWidget {
  final checktitle1;
  final checktitle2;

  const CommonCheckBoxCard(
      {super.key, required this.checktitle1, required this.checktitle2});

  @override
  State<CommonCheckBoxCard> createState() => _CommonCheckBoxCardState();
}

class _CommonCheckBoxCardState extends State<CommonCheckBoxCard> {
  bool checkUnchecktab = false;
  bool checkUnchecktab2 = false;
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());
  updateScreenFunction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              updateScreenFunction();
              checkUnchecktab = !checkUnchecktab;
              if (checkUnchecktab == true) {
                HealthInsurerController.SelectedMembers.add(widget.checktitle1);
              } else {
                HealthInsurerController.SelectedMembers.removeWhere((e) {
                  return e == widget.checktitle1.toString();
                });
              }
              print(checkUnchecktab);
            },
            child: Container(
              height: 8.2.h,
              width: 43.w,
              padding: EdgeInsets.all(1.5.h),
              decoration: BoxDecoration(
                  color: pWhite,
                  boxShadow: commonboxshadowBlue,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  checkUnchecktab
                      ? SvgPicture.asset(
                          'assets/Images/checkbox_HealthInsure.svg',
                          height: 3.h,
                          width: 3.h,
                        )
                      : SvgPicture.asset(
                          'assets/Images/uncheckbox_HealthInsure.svg',
                          height: 3.h,
                          width: 3.h,
                        ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  CommonTextNunito(
                    label: widget.checktitle1.toString(),
                    colorT: Colors.black,
                    fontw8: FontWeight.w500,
                    size: 11.sp,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              updateScreenFunction();
              checkUnchecktab2 = !checkUnchecktab2;
              if (checkUnchecktab2 == true) {
                HealthInsurerController.SelectedMembers.add(widget.checktitle2);
              } else {
                HealthInsurerController.SelectedMembers.removeWhere((e) {
                  return e == widget.checktitle2.toString();
                });
              }
              print(checkUnchecktab2);
            },
            child: Container(
              height: 8.2.h,
              width: 43.w,
              padding: EdgeInsets.all(1.5.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: commonboxshadowBlue,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  checkUnchecktab2
                      ? SvgPicture.asset(
                          'assets/Images/checkbox_HealthInsure.svg',
                          height: 3.h,
                          width: 3.h,
                        )
                      : SvgPicture.asset(
                          'assets/Images/uncheckbox_HealthInsure.svg',
                          height: 3.h,
                          width: 3.h,
                        ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  CommonTextNunito(
                    label: widget.checktitle2.toString(),
                    colorT: Colors.black,
                    fontw8: FontWeight.w500,
                    size: 11.sp,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
