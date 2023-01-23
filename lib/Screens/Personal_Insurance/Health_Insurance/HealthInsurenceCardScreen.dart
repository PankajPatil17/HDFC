// ignore_for_file: deprecated_member_use
import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/FileterAlertFab.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/HealthInsurenceCommonCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HealthInsurenceCardScreen extends StatefulWidget {
  const HealthInsurenceCardScreen({super.key});

  @override
  State<HealthInsurenceCardScreen> createState() =>
      _HealthInsurenceCardScreenState();
}

class _HealthInsurenceCardScreenState extends State<HealthInsurenceCardScreen> {
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
        floatingActionButton: Fab(),
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
                      Container(
                        width: 100.w,
                        padding: EdgeInsets.all(1.5.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: commonboxshadowBlue,
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          children: [
                            CommonTextNunito(
                              label: 'Health Insurance',
                              colorT: Color(0xff021B8D),
                              fontw8: FontWeight.bold,
                              size: 12.sp,
                            ),
                            CommonTextNunito(
                              label: 'Quotation Number: 2A6F7174A5',
                              fontw8: FontWeight.w500,
                              size: 11.sp,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        child: CommonTextNunito(
                          label: 'Members Selected: Self (29)',
                          colorT: Color(0xff6B6B6B),
                          fontw8: FontWeight.w500,
                          size: 11.sp,
                        ),
                      ),
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemBuilder: (BuildContext context, int index) {
                          return HealthInsurenceCommonCard();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            CommonBottomBar(changetabcolor: changetabcolor)
          ],
        )));
  }

  Fab() {
    return Container(
      margin: EdgeInsets.only(bottom: 9.5.h),
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: commonboxshadowBlue,
          shape: BoxShape.circle),
      child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FileterAlertFab();
                });
          },
          child: Padding(
            padding: EdgeInsets.only(top: 0.8.h),
            child: SvgPicture.asset(
              height: 18.h,
              width: 18.h,
              'assets/Images/filter.svg',
            ),
          )),
    );
  }
}
