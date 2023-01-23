// ignore_for_file: deprecated_member_use
import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/CommonMedicalHistoryCheckBox.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/CommonStepperBar.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/HealthInsurenceCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectMedicalHistory extends StatefulWidget {
  const SelectMedicalHistory({super.key});

  @override
  State<SelectMedicalHistory> createState() => _SelectMedicalHistoryState();
}

class _SelectMedicalHistoryState extends State<SelectMedicalHistory> {
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
                          pageNum: 4,
                        ),
                      ),
                      HeaderText(
                          titleLabel:
                              'Does any member have an existing illness or medical history?'),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      CommonMedicalHistoryCheckBox(
                        headertitle: 'Existing illness',
                        subheadertitle:
                            'Blood pressure, Diabetes, Heart conditions, Asthma, Thyroid, Cancer etc.',
                      ),
                      CommonMedicalHistoryCheckBox(
                        headertitle: 'Covid 19',
                        subheadertitle: 'Tested positive for Covid-19',
                      ),
                      CommonMedicalHistoryCheckBox(
                        headertitle: 'Surgical procedure',
                        subheadertitle:
                            'Appendix, Gall bladder, C-section etc.',
                      ),
                      CommonMedicalHistoryCheckBox(
                        headertitle: 'None of these',
                        subheadertitle: '',
                      ),
                      GestureDetector(
                        onTap: () {
                          if (HealthInsurerController
                                  .SelectedMedicalHistory.length >=
                              1) {
                            Get.to(HealthInsurenceCardScreen());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Please Select Atleast one Checkbox"),
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
                                label: 'View Quotes',
                                colorT: Colors.white,
                                fontw8: FontWeight.w500,
                                size: 12.sp,
                              )),
                        ),
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
