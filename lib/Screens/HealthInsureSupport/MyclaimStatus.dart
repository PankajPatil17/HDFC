// ignore_for_file: unnecessary_null_comparison

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/TrackYourClaimStatus.dart';
import 'package:sizer/sizer.dart';

class MyclaimStatus extends StatefulWidget {
  const MyclaimStatus({super.key});

  @override
  State<MyclaimStatus> createState() => _MyclaimStatusState();
}

class _MyclaimStatusState extends State<MyclaimStatus> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  FilePickerResult? result;
  var imgpath;
  uploadButton() {
    var uploadingFile = false.obs;
    return Obx(() {
      return uploadingFile.value
          ? CustomLoader()
          : GestureDetector(
              onTap: () async {
                uploadingFile.value = true;
                result =
                    await FilePicker.platform.pickFiles(allowMultiple: false);
                if (result == null) {
                  print("No file selected");
                  uploadingFile.value = false;
                  return;
                }
                imgpath = result!.files[0].path;
                await HealthInauranceController.UploadTrackClaim(img: imgpath);
                uploadingFile.value = false;
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 3.5.h, vertical: 1.5.h),
                margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/Images/Upload.svg'),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Text(
                      'Upload Document',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          fontFamily: 'Poppins',
                          color: Color(0xff363636)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: mainBlue, width: 1.0),
                    color: Colors.white),
              ));
    });
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
                      FutureBuilder(
                          future:
                              HealthInauranceController.PolicyListingFunction(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? CustomLoader()
                                : Row(
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
                                                              .policyList[index]
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
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
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
                                                                .indexOf(
                                                                    HealthInauranceController
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
                                  );
                          }),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text(
                        'My Claim Status',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            color: mainBlue),
                      ),
                      FutureBuilder(
                        future: HealthInauranceController
                            .MyClaimStatusListFunction(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            CustomLoader();
                          }
                          return HealthInauranceController.policyList.length ==
                                      0 ||
                                  HealthInauranceController.policyList.length ==
                                      null ||
                                  HealthInauranceController
                                          .MyAllClaims.length ==
                                      0 ||
                                  HealthInauranceController
                                          .MyAllClaims.length ==
                                      null
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
                                        label: 'No Claim Intimated',
                                        textStyle: labelTextStyleBlackReguler19,
                                      )
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: HealthInauranceController
                                      .MyAllClaims.length,
                                  shrinkWrap: true,
                                  controller: ScrollController(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListView.builder(
                                      controller: ScrollController(),
                                      shrinkWrap: true,
                                      itemCount: HealthInauranceController
                                          .MyAllClaims[index].length,
                                      itemBuilder: (BuildContext context,
                                          int childindex) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom: 1.h, top: 1.h),
                                          padding: EdgeInsets.all(1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: DropShadow,
                                              boxShadow: commonboxshadow),
                                          child: Theme(
                                            data: ThemeData().copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    HealthInauranceController
                                                        .MyAllClaims[index]
                                                            [childindex]
                                                            ['patient_name']
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11.sp,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xff363636)),
                                                  ),
                                                  Text(
                                                    HealthInauranceController
                                                        .MyAllClaims[index]
                                                            [childindex]
                                                            ['claim_no']
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 11.sp,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xff363636)),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Patient Name :',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 11.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        ' ${HealthInauranceController.MyAllClaims[index][childindex]['patient_name']}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 11.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Claim Status : ',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 11.sp,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        ' ${HealthInauranceController.MyAllClaims[index][childindex]['claim_status']}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Hospital Name : ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              ' ${HealthInauranceController.MyAllClaims[index][childindex]['hospital_name']}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 0.4.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Intimation Date : ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              ' ${HealthInauranceController.MyAllClaims[index][childindex]['intimation_date']}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 0.4.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Admission Date : ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              ' ${HealthInauranceController.MyAllClaims[index][childindex]['date_of_admission']}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 0.4.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Claim Number : ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              '  ${HealthInauranceController.MyAllClaims[index][childindex]['claim_no']}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 0.4.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Hospital Name : ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              ' ${HealthInauranceController.MyAllClaims[index][childindex]['hospital_name']}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 0.4.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Latest Updates Date : ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              ' ${HealthInauranceController.MyAllClaims[index][childindex]['latest_updated_deficiency_dt']}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.to(
                                                                TrackYourClaimStatus(
                                                                  childind:
                                                                      childindex,
                                                                  ind: index,
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        10));
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          3.5.h,
                                                                      vertical:
                                                                          1.5.h),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 2.h),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/Images/Track Your Claim.svg'),
                                                                  SizedBox(
                                                                    width:
                                                                        1.5.h,
                                                                  ),
                                                                  Text(
                                                                    'Track Your Claim',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize: 11
                                                                            .sp,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xff363636)),
                                                                  ),
                                                                ],
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                  border: Border.all(
                                                                      color:
                                                                          mainBlue,
                                                                      width:
                                                                          1.0),
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: uploadButton(),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
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
}
