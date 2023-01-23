import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/HealthInsuranceMainScreen.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/SelectYourAge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonGroupCheckboxCard extends StatefulWidget {
  final checktitle1;
  final checkImg1;
  final checktitle2;
  final checkImg2;
  final checktitle3;
  final checkImg3;
  final checktitle4;
  final checkImg4;
  final checktitle5;
  final checkImg5;
  final checktitle6;
  final checkImg6;

  const CommonGroupCheckboxCard(
      {super.key,
      required this.checktitle1,
      required this.checktitle2,
      required this.checkImg1,
      required this.checkImg2,
      required this.checktitle3,
      required this.checkImg3,
      required this.checktitle4,
      required this.checkImg4,
      required this.checktitle5,
      required this.checkImg5,
      required this.checktitle6,
      required this.checkImg6});

  @override
  State<CommonGroupCheckboxCard> createState() =>
      _CommonGroupCheckboxCardState();
}

class _CommonGroupCheckboxCardState extends State<CommonGroupCheckboxCard> {
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());
  updateScreenFunction() {
    setState(() {});
  }

  var checkTab = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  updateScreenFunction();
                  checkTab = widget.checktitle1.toString();
                },
                child: Container(
                  height: 8.5.h,
                  width: 43.w,
                  padding: EdgeInsets.all(1.5.h),
                  decoration: BoxDecoration(
                      color: pWhite,
                      boxShadow: commonboxshadowBlue,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      checkTab == widget.checktitle1.toString()
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: SvgPicture.asset(
                          '${widget.checkImg1}',
                          height: 2.4.h,
                          width: 2.4.h,
                        ),
                      ),
                      Expanded(
                        child: CommonTextNunito(
                          label: widget.checktitle1.toString(),
                          colorT: Colors.black,
                          fontw8: FontWeight.w500,
                          maxline: 2,
                          size: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  updateScreenFunction();
                  checkTab = widget.checktitle2.toString();
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
                      checkTab == widget.checktitle2.toString()
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: SvgPicture.asset(
                          '${widget.checkImg2}',
                          height: 3.h,
                          width: 3.h,
                        ),
                      ),
                      Expanded(
                        child: CommonTextNunito(
                          label: widget.checktitle2.toString(),
                          colorT: Colors.black,
                          fontw8: FontWeight.w500,
                          size: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  updateScreenFunction();
                  checkTab = widget.checktitle3.toString();
                },
                child: Container(
                  height: 8.5.h,
                  width: 43.w,
                  padding: EdgeInsets.all(1.5.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: commonboxshadowBlue,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      checkTab == widget.checktitle3.toString()
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: SvgPicture.asset(
                          '${widget.checkImg3}',
                          height: 2.4.h,
                          width: 2.4.h,
                        ),
                      ),
                      Expanded(
                        child: CommonTextNunito(
                          label: widget.checktitle3.toString(),
                          colorT: Colors.black,
                          fontw8: FontWeight.w500,
                          maxline: 2,
                          size: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  updateScreenFunction();
                  checkTab = widget.checktitle4.toString();
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
                      checkTab == widget.checktitle4.toString()
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: SvgPicture.asset(
                          '${widget.checkImg4}',
                          height: 3.h,
                          width: 3.h,
                        ),
                      ),
                      Expanded(
                        child: CommonTextNunito(
                          label: widget.checktitle4.toString(),
                          colorT: Colors.black,
                          fontw8: FontWeight.w500,
                          size: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  updateScreenFunction();
                  checkTab = widget.checktitle5.toString();
                },
                child: Container(
                  height: 8.5.h,
                  width: 43.w,
                  padding: EdgeInsets.all(1.5.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: commonboxshadowBlue,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      checkTab == widget.checktitle5.toString()
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: SvgPicture.asset(
                          '${widget.checkImg5}',
                          height: 2.4.h,
                          width: 2.4.h,
                        ),
                      ),
                      Expanded(
                        child: CommonTextNunito(
                          label: widget.checktitle5.toString(),
                          colorT: Colors.black,
                          fontw8: FontWeight.w500,
                          maxline: 2,
                          size: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  updateScreenFunction();
                  checkTab = widget.checktitle6.toString();
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
                      checkTab == widget.checktitle6.toString()
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: SvgPicture.asset(
                          '${widget.checkImg6}',
                          height: 3.h,
                          width: 3.h,
                        ),
                      ),
                      Expanded(
                        child: CommonTextNunito(
                          label: widget.checktitle6.toString(),
                          colorT: Colors.black,
                          fontw8: FontWeight.w500,
                          size: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (checkTab == widget.checktitle6.toString()) {
              HealthInsurerController.SelectedMembers.clear();
              HealthInsurerController.son = 0;
              HealthInsurerController.Daughter = 0;
              Get.to(HealthInsuranceMainScreen());
            } else if (checkTab == widget.checktitle1.toString()) {
              HealthInsurerController.son = 0;
              HealthInsurerController.Daughter = 0;
              HealthInsurerController.SelectedMembers.clear();
              HealthInsurerController.SelectedMembers.add('Self');
              Get.to(SelectYourAge());
            } else if (checkTab == widget.checktitle2.toString()) {
              HealthInsurerController.son = 0;
              HealthInsurerController.Daughter = 0;
              HealthInsurerController.SelectedMembers.clear();
              HealthInsurerController.SelectedMembers.add('Self');
              HealthInsurerController.SelectedMembers.add('Spouse');
              Get.to(SelectYourAge());
            } else if (checkTab == widget.checktitle3.toString()) {
              HealthInsurerController.son = 0;
              HealthInsurerController.Daughter = 0;
              HealthInsurerController.SelectedMembers.clear();
              HealthInsurerController.SelectedMembers.add('Self');
              HealthInsurerController.SelectedMembers.add('Spouse');
              HealthInsurerController.son = 1;
              Get.to(SelectYourAge());
            } else if (checkTab == widget.checktitle4.toString()) {
              HealthInsurerController.son = 0;
              HealthInsurerController.Daughter = 0;
              HealthInsurerController.SelectedMembers.clear();
              HealthInsurerController.SelectedMembers.add('Self');
              HealthInsurerController.SelectedMembers.add('Spouse');
              HealthInsurerController.son = 1;
              HealthInsurerController.Daughter = 1;
              Get.to(SelectYourAge());
            } else if (checkTab == widget.checktitle5.toString()) {
              HealthInsurerController.son = 0;
              HealthInsurerController.Daughter = 0;
              HealthInsurerController.SelectedMembers.clear();
              HealthInsurerController.SelectedMembers.add('Father');
              HealthInsurerController.SelectedMembers.add('Mother');
              Get.to(SelectYourAge());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Please Select Atleast one Checkbox"),
              ));
            }
          },
          child: Center(
            child: Container(
                margin: EdgeInsets.only(top: 3.h, bottom: 2.5.h),
                height: 6.h,
                width: 15.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      Color(0xff49D49D),
                      Color(0xff49D49D),
                    ])),
                child: CommonTextNunito(
                  label: 'Next',
                  colorT: Colors.white,
                  fontw8: FontWeight.w500,
                  size: 12.sp,
                )),
          ),
        ),
      ],
    );
  }
}
