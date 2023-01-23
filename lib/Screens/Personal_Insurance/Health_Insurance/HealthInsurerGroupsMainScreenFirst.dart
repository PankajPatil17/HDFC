// ignore_for_file: deprecated_member_use
import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/CommonGroupCheckboxCard.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/CommonStepperBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HealthInsurerGroupsMainScreenFirst extends StatefulWidget {
  const HealthInsurerGroupsMainScreenFirst({super.key});

  @override
  State<HealthInsurerGroupsMainScreenFirst> createState() =>
      _HealthInsurerGroupsMainScreenFirstState();
}

class _HealthInsurerGroupsMainScreenFirstState
    extends State<HealthInsurerGroupsMainScreenFirst> {
  var changetabcolor;
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());

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
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Image.asset(
                      'assets/Images/Hdfc_Logo.png',
                      height: 4.h,
                      width: 4.h,
                    ),
                  ),
                ],
              ),
            )),
            preferredSize: Size(100.h, 7.h)),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderText(
                          titleLabel:
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut'),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                        child: CommonStepperBar(
                          pageNum: 1,
                        ),
                      ),
                      HeaderText(
                          titleLabel: 'Tell us who would you like to insure'),
                      CommonGroupCheckboxCard(
                        checktitle1: 'Me',
                        checktitle2: 'Me & Spouse',
                        checkImg1: 'assets/Images/Me.svg',
                        checkImg2: 'assets/Images/Me-spouse.svg',
                        checktitle3: 'Me & Spouse & 1 Child',
                        checkImg3: 'assets/Images/Me-spose-child.svg',
                        checktitle4: 'Me, Spouse & 2 Child',
                        checkImg4: 'assets/Images/Me-Spouse-2 Child.svg',
                        checktitle5: 'My Parents',
                        checkImg5: 'assets/Images/parents.svg',
                        checktitle6: 'Other Members',
                        checkImg6: 'assets/Images/Other-members.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CommonBottomBar(changetabcolor: changetabcolor)
          ],
        )));
  }

//header Text
  HeaderText({titleLabel}) {
    return CommonTextNunito(
      label: titleLabel,
      colorT: Color(0xff6B6B6B),
      fontw8: FontWeight.w400,
      size: 13.sp,
    );
  }
}
