import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';

class TrackYourClaimStatus extends StatefulWidget {
  final ind;
  final childind;

  const TrackYourClaimStatus(
      {super.key, required this.ind, required this.childind});

  @override
  State<TrackYourClaimStatus> createState() => _TrackYourClaimStatusState();
}

class _TrackYourClaimStatusState extends State<TrackYourClaimStatus> {
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
                      // FutureBuilder(
                      //     future:
                      //         HealthInauranceController.PolicyListingFunction(),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<dynamic> snapshot) {
                      //       return snapshot.connectionState ==
                      //               ConnectionState.waiting
                      //           ? CustomLoader()
                      //           : Row(
                      //               children: [
                      //                 Text(
                      //                   'Policy Type',
                      //                   textAlign: TextAlign.center,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   maxLines: 2,
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.w500,
                      //                       fontSize: 13.sp,
                      //                       fontFamily: 'Poppins'),
                      //                 ),
                      //                 Container(
                      //                   height: 5.h,
                      //                   width: 30.h,
                      //                   child: ListView.builder(
                      //                     scrollDirection: Axis.horizontal,
                      //                     itemCount: HealthInauranceController
                      //                         .policyList.length,
                      //                     itemBuilder: (BuildContext context,
                      //                         int index) {
                      //                       return GestureDetector(
                      //                         onTap: () {
                      //                           setState(() {
                      //                             changeTab = '';
                      //                             policytype =
                      //                                 HealthInauranceController
                      //                                         .policyList[index]
                      //                                     ['policy_type'];
                      //                             HealthInauranceController
                      //                                     .indexvalue =
                      //                                 HealthInauranceController
                      //                                     .policyList
                      //                                     .indexOf(
                      //                                         HealthInauranceController
                      //                                                 .policyList[
                      //                                             index]);
                      //                           });
                      //                         },
                      //                         child: Container(
                      //                           alignment: Alignment.center,
                      //                           height: 5.h,
                      //                           width: 8.h,
                      //                           margin:
                      //                               EdgeInsets.only(left: 1.h),
                      //                           decoration: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(12),
                      //                             border: Border.all(
                      //                                 width: 1.5,
                      //                                 color: Color(0xffe4e4e4)),
                      //                             gradient: HealthInauranceController
                      //                                         .indexvalue ==
                      //                                     HealthInauranceController
                      //                                         .policyList
                      //                                         .indexOf(
                      //                                             HealthInauranceController
                      //                                                     .policyList[
                      //                                                 index])
                      //                                 ? LinearGradient(colors: [
                      //                                     Color(0XFF2A8ABF),
                      //                                     Color(0xFF165273)
                      //                                   ])
                      //                                 : LinearGradient(colors: [
                      //                                     Colors.transparent,
                      //                                     Colors.transparent
                      //                                   ]),
                      //                           ),
                      //                           child: CommonText(
                      //                             label:
                      //                                 '${HealthInauranceController.policyList[index]['policy_type']}',
                      //                             textStyle: TextStyle(
                      //                                 fontWeight:
                      //                                     FontWeight.w400,
                      //                                 fontSize: 12.sp,
                      //                                 color: HealthInauranceController
                      //                                             .indexvalue ==
                      //                                         HealthInauranceController
                      //                                             .policyList
                      //                                             .indexOf(HealthInauranceController
                      //                                                     .policyList[
                      //                                                 index])
                      //                                     ? Colors.white
                      //                                     : Colors.black,
                      //                                 fontFamily: 'Poppins'),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             );
                      //     }),
                      SizedBox(
                        // height: 2.5.h,
                        height: 0.5.h,
                      ),
                      Text(
                        'Track Your Claim',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            color: Color(0xff338EC0)),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      FutureBuilder(
                        future: HealthInauranceController.TrackYourClaim(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 1.3.h, top: 1.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'NAME OF INSURED',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['patient_name']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'PATIENT NAME',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['patient_name']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'HOSPITAL NAME',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 23.h,
                                      child: CommonText(
                                        label:
                                            ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['hospital_name']}',
                                        textStyle: labelTextStyleBlackReguler16,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'RELATION',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['relation']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'DATE OF ADMISSION',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['date_of_admission']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'DATE OF DISCHARGE',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['date_of_discharge']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'CLAIM NUMBER',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25.h,
                                      child: Text(
                                        ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['claim_no']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'CLAIM STATUS',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['claim_status']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'OUTSTANDING CLAIM STATUS',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['outstanding_claim_status']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'CLAIM TYPE',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['claim_type']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'NETWORK STATUS',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['network_status']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'CLAIM REGISTERED DATE',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['claim_registered_date']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'DISEASE CATEGORY',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['DISEASE_CATEGORY']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'FILE RECEIVED DATE',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['file_received_date']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'CLAIM AMOUNT',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['claim_amount']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'DEDUCTION AMOUNT',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label:
                                          ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['deduction_amount']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'DEDUCTION REASON',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label:
                                            ': ${HealthInauranceController.trackstatus[widget.ind][widget.childind]['deduction_reason']}',
                                        textStyle: labelTextStyleBlackReguler16,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'AMOUNT PAID',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label: ': 0',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'AMOUNT PAID DATE',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label: ': ',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.3.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20.h,
                                      child: CommonText(
                                        label: 'REASON FOR CLOSURE',
                                        textStyle: labelTextStyleMedium14,
                                      ),
                                    ),
                                    CommonText(
                                      label: ': ',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
