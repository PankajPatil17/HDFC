// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/HealthInsureController.dart';
import 'package:odin/Generic/Common/CommonBottomBar.dart';
import 'package:odin/Generic/Common/CommonLoader.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:odin/Generic/Constant/colors.dart';
import 'package:odin/Generic/Constant/variables.dart';
import 'package:odin/Screens/HealthInsureSupport/DownloadForms.dart';
import 'package:odin/Screens/HealthInsureSupport/IntimateClaim.dart';
import 'package:odin/Screens/HealthInsureSupport/MembersCoverd.dart';
import 'package:odin/Screens/HealthInsureSupport/MyCoverage.dart';
import 'package:odin/Screens/HealthInsureSupport/MyclaimStatus.dart';
import 'package:odin/Screens/HealthInsureSupport/NetworkHospital.dart';
import 'package:odin/Screens/HealthInsureSupport/ShareYourDocuments.dart';
import 'package:sizer/sizer.dart';

class HealthInsureSupportMainScreen extends StatefulWidget {
  const HealthInsureSupportMainScreen({super.key});

  @override
  State<HealthInsureSupportMainScreen> createState() =>
      _HealthInsureSupportMainScreenState();
}

class _HealthInsureSupportMainScreenState
    extends State<HealthInsureSupportMainScreen> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
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
          child: FutureBuilder(
              future: HealthInauranceController.PolicyListingFunction(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? CustomLoader()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    HealthInauranceController
                                                .policyList.length ==
                                            0
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.h, bottom: 4.h),
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
                                                  textStyle:
                                                      labelTextStyleBlackReguler19,
                                                )
                                              ],
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Policy Type',
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13.sp,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  Container(
                                                    height: 5.h,
                                                    width: 30.h,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          HealthInauranceController
                                                              .policyList
                                                              .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              changeTab = '';
                                                              policytype =
                                                                  HealthInauranceController
                                                                              .policyList[
                                                                          index]
                                                                      [
                                                                      'policy_type'];
                                                              HealthInauranceController
                                                                      .indexvalue =
                                                                  HealthInauranceController
                                                                      .policyList
                                                                      .indexOf(HealthInauranceController
                                                                              .policyList[
                                                                          index]);
                                                            });
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 5.h,
                                                            width: 8.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 1.h),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                border: Border.all(
                                                                    width: 1.0,
                                                                    color:
                                                                        mainBlue),
                                                                color: HealthInauranceController
                                                                            .indexvalue ==
                                                                        HealthInauranceController
                                                                            .policyList
                                                                            .indexOf(HealthInauranceController.policyList[
                                                                                index])
                                                                    ? mainBlue
                                                                    : Colors
                                                                        .transparent),
                                                            child: CommonText(
                                                              label:
                                                                  '${HealthInauranceController.policyList[index]['policy_type']}',
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: HealthInauranceController
                                                                              .indexvalue ==
                                                                          HealthInauranceController.policyList.indexOf(HealthInauranceController.policyList[
                                                                              index])
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                // height: 75.h,
                                                width: 100.h,
                                                margin: EdgeInsets.only(
                                                    top: 2.h, bottom: 2.h),
                                                padding: EdgeInsets.all(2.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: mainBlue,
                                                        width: 0.5)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 15.9.h,
                                                          child: CommonText(
                                                              label:
                                                                  'Insurance\ncompany name :',
                                                              maxLines: 4,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        SizedBox(
                                                          width: 23.5.h,
                                                          child: CommonText(
                                                            label: HealthInauranceController
                                                                        .policyList[
                                                                    HealthInauranceController
                                                                        .indexvalue]
                                                                [
                                                                'insurer_name'],
                                                            maxLines: 4,
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10.sp,
                                                                fontFamily:
                                                                    'Poppins'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 16.h,
                                                          child: CommonText(
                                                              label:
                                                                  'Policy Holder \nname :',
                                                              maxLines: 4,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        SizedBox(
                                                          width: 23.5.h,
                                                          child: CommonText(
                                                            label: HealthInauranceController
                                                                    .policyList[0]
                                                                [
                                                                'product_name'],
                                                            // 'Sayas Cooperative Pvt.Ltd',
                                                            maxLines: 4,
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10.sp,
                                                                fontFamily:
                                                                    'Poppins'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 16.h,
                                                          child: CommonText(
                                                              label:
                                                                  'Policy Number :',
                                                              maxLines: 4,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        CommonText(
                                                          label: HealthInauranceController
                                                                      .policyList[
                                                                  HealthInauranceController
                                                                      .indexvalue]
                                                              ['policy_no'],
                                                          // '332204/48/2022/xxxx',
                                                          maxLines: 4,
                                                          textStyle: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 16.h,
                                                          child: CommonText(
                                                              label:
                                                                  'Policy Type :',
                                                              maxLines: 2,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        CommonText(
                                                          label: HealthInauranceController
                                                                      .policyList[
                                                                  HealthInauranceController
                                                                      .indexvalue]
                                                              ['policy_type'],
                                                          // 'GMC',
                                                          maxLines: 2,
                                                          textStyle: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 16.h,
                                                          child: CommonText(
                                                              label:
                                                                  'TPA Name :',
                                                              maxLines: 2,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        SizedBox(
                                                          width: 23.h,
                                                          child: CommonText(
                                                            label: HealthInauranceController
                                                                        .policyList[
                                                                    HealthInauranceController
                                                                        .indexvalue]
                                                                ['tpa_name'],
                                                            //  'Health Insurance Tpa',
                                                            maxLines: 4,
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10.sp,
                                                                fontFamily:
                                                                    'Poppins'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 16.h,
                                                          child: CommonText(
                                                              label:
                                                                  'Policy Expiry date :',
                                                              maxLines: 2,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        CommonText(
                                                          label: HealthInauranceController
                                                                      .policyList[
                                                                  HealthInauranceController
                                                                      .indexvalue]
                                                              ['end_date'],
                                                          // '30-05-2023',
                                                          maxLines: 2,
                                                          textStyle: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 16.h,
                                                          child: CommonText(
                                                              label:
                                                                  'Sum Insured:',
                                                              maxLines: 1,
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'Poppins')),
                                                        ),
                                                        CommonText(
                                                          label: HealthInauranceController
                                                                      .policyList[
                                                                  HealthInauranceController
                                                                      .indexvalue]
                                                              ['sum_insured'],
                                                          // '4,00,000',
                                                          maxLines: 1,
                                                          textStyle: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),

//1 st row

                                                    policytype == 'GPA' ||
                                                            policytype == 'GTL'
                                                        ? ThreeModules()
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Get.to(
                                                                          MyCoverage(),
                                                                          transition:
                                                                              transitoineffect);
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              8.h,
                                                                          width:
                                                                              8.h,
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 0.8.h),
                                                                          decoration: BoxDecoration(
                                                                              color: DropShadow,
                                                                              boxShadow: commonboxshadow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(36))),
                                                                          child:
                                                                              Center(
                                                                            child: SvgPicture.asset(
                                                                                height: 4.h,
                                                                                color: mainBlue,
                                                                                'assets/Images/My_Coverage.svg'),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'My\nCoverage',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 10.sp,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Get.to(
                                                                          NetworkHospital(),
                                                                          transition:
                                                                              transitoineffect);
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              8.h,
                                                                          width:
                                                                              8.h,
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 0.8.h),
                                                                          decoration: BoxDecoration(
                                                                              color: DropShadow,
                                                                              boxShadow: commonboxshadow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(36))),
                                                                          child:
                                                                              Center(
                                                                            child: SvgPicture.asset(
                                                                                height: 4.h,
                                                                                color: mainBlue,
                                                                                'assets/Images/Network_hospital.svg'),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Network\nHospital',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 10.sp,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        Get.to(
                                                                            IntimateClaim(),
                                                                            transition:
                                                                                transitoineffect);
                                                                      });
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              8.h,
                                                                          width:
                                                                              8.h,
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 0.8.h),
                                                                          decoration: BoxDecoration(
                                                                              color: DropShadow,
                                                                              boxShadow: commonboxshadow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(36))),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/Images/Intimate_my_claim.svg',
                                                                              height: 4.h,
                                                                              color: mainBlue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Intimate\nMy Claims',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 10.sp,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),

// 2nd Row

                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        Get.to(
                                                                            DownloadForms(),
                                                                            transition:
                                                                                transitoineffect);
                                                                      });
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              8.h,
                                                                          width:
                                                                              8.h,
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 0.8.h),
                                                                          decoration: BoxDecoration(
                                                                              color: DropShadow,
                                                                              boxShadow: commonboxshadow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(36))),
                                                                          child:
                                                                              Center(
                                                                            child: SvgPicture.asset(
                                                                                height: 4.h,
                                                                                color: mainBlue,
                                                                                'assets/Images/Download_form.svg'),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Download\nForms',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 10.sp,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Get.to(
                                                                          MembersCoverd(),
                                                                          transition:
                                                                              transitoineffect);
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              8.h,
                                                                          width:
                                                                              8.h,
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 0.8.h),
                                                                          decoration: BoxDecoration(
                                                                              color: DropShadow,
                                                                              boxShadow: commonboxshadow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(36))),
                                                                          child:
                                                                              Center(
                                                                            child: SvgPicture.asset(
                                                                                height: 4.h,
                                                                                color: mainBlue,
                                                                                'assets/Images/Members_Covered.svg'),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Members\nCovered',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 10.sp,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Get.to(
                                                                          MyclaimStatus(),
                                                                          transition:
                                                                              transitoineffect);
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              8.h,
                                                                          width:
                                                                              8.h,
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 0.8.h),
                                                                          decoration: BoxDecoration(
                                                                              color: DropShadow,
                                                                              boxShadow: commonboxshadow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(36))),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/Images/My_Claim_status.svg',
                                                                              height: 4.h,
                                                                              color: mainBlue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'My Claim\nStatus',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 10.sp,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(ShareYourDocuments(),
                                                transition: transitoineffect);
                                          },
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 1.h),
                                            padding: EdgeInsets.only(
                                                left: 2.h,
                                                right: 2.h,
                                                top: 1.5.h,
                                                bottom: 1.5.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: mainBlue),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Images/share.svg'),
                                                SizedBox(
                                                  width: 1.h,
                                                ),
                                                Text(
                                                  'Share your documents',
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11.sp,
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // GestureDetector(
                                        //   onTap: () {
                                        //     HealthInauranceController
                                        //                 .policyList.length ==
                                        //             0
                                        //         ? launch(
                                        //             'tel: 9021434305',
                                        //           )
                                        //         : Get.to(ContactUs(),
                                        //             transition:
                                        //                 transitoineffect);
                                        //   },
                                        //   child: Container(
                                        //     margin:
                                        //         EdgeInsets.only(bottom: 1.h),
                                        //     padding: EdgeInsets.only(
                                        //         left: 2.h,
                                        //         right: 2.h,
                                        //         top: 1.5.h,
                                        //         bottom: 1.5.h),
                                        //     decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(6),
                                        //         color: mainBlue),
                                        //     child: Row(
                                        //       children: [
                                        //         SvgPicture.asset(
                                        //             'assets/Images/call_icon.svg'),
                                        //         SizedBox(
                                        //           width: 1.h,
                                        //         ),
                                        //         Text(
                                        //           'Call',
                                        //           textAlign: TextAlign.center,
                                        //           overflow:
                                        //               TextOverflow.ellipsis,
                                        //           style: TextStyle(
                                        //               fontWeight:
                                        //                   FontWeight.w400,
                                        //               fontSize: 11.sp,
                                        //               color: Colors.white,
                                        //               fontFamily: 'Poppins'),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CommonBottomBar(changetabcolor: changetabcolor)
                        ],
                      );
              })),
    );
  }

  ThreeModules() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(MyCoverage(), transition: transitoineffect);
          },
          child: Column(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                margin: EdgeInsets.only(bottom: 0.8.h),
                decoration: BoxDecoration(
                    color: DropShadow,
                    boxShadow: commonboxshadow,
                    borderRadius: BorderRadius.all(Radius.circular(36))),
                child: Center(
                  child: SvgPicture.asset(
                      height: 4.h,
                      color: mainBlue,
                      'assets/Images/My_Coverage.svg'),
                ),
              ),
              Text(
                'My\nCoverage',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(DownloadForms(), transition: transitoineffect);
          },
          child: Column(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                margin: EdgeInsets.only(bottom: 0.8.h),
                decoration: BoxDecoration(
                    color: DropShadow,
                    boxShadow: commonboxshadow,
                    borderRadius: BorderRadius.all(Radius.circular(36))),
                child: Center(
                  child: SvgPicture.asset(
                      height: 4.h,
                      color: mainBlue,
                      'assets/Images/Download_form.svg'),
                ),
              ),
              Text(
                'Download\nForms',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Get.to(MyclaimStatus(), transition: transitoineffect);
            });
          },
          child: Column(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                margin: EdgeInsets.only(bottom: 0.8.h),
                decoration: BoxDecoration(
                    color: DropShadow,
                    boxShadow: commonboxshadow,
                    borderRadius: BorderRadius.all(Radius.circular(36))),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/Images/My_Claim_status.svg',
                    height: 4.h,
                    color: mainBlue,
                  ),
                ),
              ),
              Text(
                'My Claim\nStatus',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
