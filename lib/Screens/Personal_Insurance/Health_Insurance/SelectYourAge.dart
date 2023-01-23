import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/CommonDropDown.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/CommonStepperBar.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/SelectCity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectYourAge extends StatefulWidget {
  const SelectYourAge({super.key});

  @override
  State<SelectYourAge> createState() => _SelectYourAgeState();
}

class _SelectYourAgeState extends State<SelectYourAge> {
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
                          pageNum: 2,
                        ),
                      ),
                      HeaderText(titleLabel: 'Please select your age'),
                      HealthInsurerController.SelectedMembers.length == 0
                          ? Container()
                          : SizedBox(
                              height: 1.5.h,
                            ),
                      HealthInsurerController.SelectedMembers.length == 0
                          ? Container()
                          : GridView.builder(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 1.9.h,
                                      mainAxisSpacing: 1.9.h,
                                      mainAxisExtent: 9.h,
                                      maxCrossAxisExtent: 200),
                              itemCount: HealthInsurerController
                                  .SelectedMembers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CommonDropDown(
                                    headTitle: HealthInsurerController
                                        .SelectedMembers[index]);
                              },
                            ),
                      HealthInsurerController.son == 0
                          ? Container()
                          : SizedBox(
                              height: 1.5.h,
                            ),
                      HealthInsurerController.son == 0
                          ? Container()
                          : GridView.builder(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 1.9.h,
                                      mainAxisSpacing: 1.9.h,
                                      mainAxisExtent: 9.h,
                                      maxCrossAxisExtent: 200),
                              itemCount: HealthInsurerController.son,
                              itemBuilder: (BuildContext context, int index) {
                                return CommonDropDown(
                                    headTitle: 'Son ${index + 1}');
                              },
                            ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 1.9.h,
                            mainAxisSpacing: 1.9.h,
                            mainAxisExtent: 9.h,
                            maxCrossAxisExtent: 200),
                        itemCount: HealthInsurerController.Daughter,
                        itemBuilder: (BuildContext context, int index) {
                          return CommonDropDown(
                              headTitle: 'Daughter ${index + 1}');
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          if (HealthInsurerController.FinalNameWithAge.length >=
                              1) {
                            Get.to(SelectCity());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please Select Atleast one Age"),
                            ));
                          }
                          print(HealthInsurerController.FinalNameWithAge);
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
