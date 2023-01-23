import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:sizer/sizer.dart';

class ViewSummary extends StatefulWidget {
  const ViewSummary({super.key});

  @override
  State<ViewSummary> createState() => _ViewSummaryState();
}

class _ViewSummaryState extends State<ViewSummary> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
  TextEditingController coveragecontroller = TextEditingController();
  @override
  void initState() {
    changetabcolor = '';
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
            padding: EdgeInsets.symmetric(horizontal: 1.2.h),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(),
                SvgPicture.asset(
                  'assets/Images/Odin_Logo.svg',
                  height: 3.h,
                  width: 3.h,
                ),
                Spacer(),
                SvgPicture.asset('assets/Images/Notification.svg'),
              ],
            ),
          )),
          preferredSize: Size(100.h, 20.h)),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            width: 100.h,
            padding: EdgeInsets.all(2.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: HealthInauranceController.PolicyListingFunction(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? CustomLoader()
                          : HealthInauranceController.policyList.length == 0
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.h, bottom: 4.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/Images/No_Claims.gif'),
                                      SizedBox(
                                        height: 1.5.h,
                                      ),
                                      CommonText(
                                        label: 'No Policy Found',
                                        textStyle: labelTextStyleBlackReguler19,
                                      )
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Policy Type',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                              fontFamily: 'Poppins'),
                                        ),
                                        Container(
                                          height: 5.h,
                                          width: 30.h,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: HealthInauranceController
                                                .policyList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    changeTab = '';
                                                    policytype =
                                                        HealthInauranceController
                                                                    .policyList[
                                                                index]
                                                            ['policy_type'];
                                                    HealthInauranceController
                                                            .indexvalue =
                                                        HealthInauranceController
                                                            .policyList
                                                            .indexOf(
                                                                HealthInauranceController
                                                                        .policyList[
                                                                    index]);
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 5.h,
                                                  width: 8.h,
                                                  margin: EdgeInsets.only(
                                                      left: 1.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          width: 1.0,
                                                          color: mainBlue),
                                                      color: HealthInauranceController
                                                                  .indexvalue ==
                                                              HealthInauranceController
                                                                  .policyList
                                                                  .indexOf(HealthInauranceController
                                                                          .policyList[
                                                                      index])
                                                          ? mainBlue
                                                          : Colors.transparent),
                                                  child: CommonText(
                                                    label:
                                                        '${HealthInauranceController.policyList[index]['policy_type']}',
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.sp,
                                                        color: HealthInauranceController
                                                                    .indexvalue ==
                                                                HealthInauranceController
                                                                    .policyList
                                                                    .indexOf(HealthInauranceController
                                                                            .policyList[
                                                                        index])
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SummaryCard(
                                        staticname: 'Insurance Company Name',
                                        dynamicname:
                                            "${HealthInauranceController.policyList[HealthInauranceController.indexvalue]['insurer_name']}"),
                                    SummaryCard(
                                        staticname: 'Policy Holder Name',
                                        dynamicname:
                                            "${HealthInauranceController.policyList[0]['product_name']}"),
                                    SummaryCard(
                                        staticname: 'Policy Number',
                                        dynamicname:
                                            "${HealthInauranceController.policyList[HealthInauranceController.indexvalue]['policy_no']}"),
                                    SummaryCard(
                                        staticname: 'Policy Type',
                                        dynamicname:
                                            "${HealthInauranceController.policyList[HealthInauranceController.indexvalue]['policy_type']}"),
                                    policytype == 'GPA' || policytype == 'GTL'
                                        ? Container()
                                        : SummaryCard(
                                            staticname: 'Tpa Name',
                                            dynamicname:
                                                "${HealthInauranceController.policyList[HealthInauranceController.indexvalue]['tpa_name']}"),
                                    SummaryCard(
                                        staticname: 'Policy Expiry date',
                                        dynamicname:
                                            "${HealthInauranceController.policyList[HealthInauranceController.indexvalue]['end_date']}"),
                                    SummaryCard(
                                        staticname: 'Sum Insured',
                                        dynamicname:
                                            "${HealthInauranceController.policyList[HealthInauranceController.indexvalue]['sum_insured']}"),
                                    SizedBox(
                                      height: 2.h,
                                    )
                                  ],
                                );
                    },
                  )
                ],
              ),
            ),
          )),
          CommonBottomBar(changetabcolor: '')
        ],
      )),
    );
  }

  SummaryCard({staticname, dynamicname}) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: commonboxshadow,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 0.5, color: Color(0xffe4e4e4))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.h,
            height: 10.h,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.h, top: 2.h, bottom: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                    label: staticname,
                    maxLines: 1,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins')),
                CommonText(
                  label: dynamicname,
                  maxLines: 1,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 1.h,
            height: 10.h,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
          ),
        ],
      ),
    );
  }
}
