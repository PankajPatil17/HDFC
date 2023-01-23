import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonMedicalHistoryCheckBox extends StatefulWidget {
  final headertitle;
  final subheadertitle;

  const CommonMedicalHistoryCheckBox(
      {required this.headertitle, required this.subheadertitle});

  @override
  State<CommonMedicalHistoryCheckBox> createState() =>
      _CommonMedicalHistoryCheckBoxState();
}

class _CommonMedicalHistoryCheckBoxState
    extends State<CommonMedicalHistoryCheckBox> {
  bool checkUnchecktab2 = false;
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());
  updateScreenFunction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateScreenFunction();
        checkUnchecktab2 = !checkUnchecktab2;
        if (checkUnchecktab2 == true) {
          HealthInsurerController.SelectedMedicalHistory.add(
              widget.headertitle);
        } else {
          HealthInsurerController.SelectedMedicalHistory.removeWhere((e) {
            return e == widget.headertitle.toString();
          });
        }
        print(checkUnchecktab2);
      },
      child: Container(
        width: 100.w,
        padding: EdgeInsets.all(1.8.h),
        margin: EdgeInsets.only(bottom: 1.8.h),
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
              width: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextNunito(
                  label: widget.headertitle.toString(),
                  colorT: Colors.black,
                  fontw8: FontWeight.w500,
                  size: 11.sp,
                ),
                widget.subheadertitle.toString() == ''
                    ? Container()
                    : SizedBox(
                        height: 0.4.h,
                      ),
                widget.subheadertitle.toString() == ''
                    ? Container()
                    : SizedBox(
                        width: 72.w,
                        child: CommonTextNunito(
                          label: widget.subheadertitle.toString(),
                          colorT: Color(0xff6B6B6B),
                          fontw8: FontWeight.w500,
                          size: 10.sp,
                          maxline: 3,
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
