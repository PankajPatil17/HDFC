import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadForms extends StatefulWidget {
  const DownloadForms({super.key});

  @override
  State<DownloadForms> createState() => _DownloadFormsState();
}

class _DownloadFormsState extends State<DownloadForms> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  var _url;
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not launch $url';
    }
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
                    'assets/Images/hdfc_Logo.png',
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
                          future: HealthInauranceController.MembersCovered(),
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
                                            fontFamily: 'Inter'),
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
                                                      fontFamily: 'Inter'),
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
                        'Download Forms',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                            color: mainBlue),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      FutureBuilder(
                          future: HealthInauranceController
                              .MyDocDownloadListFunction(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  textStyle: labelTextStyleBlackReguler14,
                                  label: '  Download All Forms and Documents',
                                ),
                                HealthInauranceController
                                            .DocDownloadList.length ==
                                        0
                                    ? CommonText(
                                        label: "No Forms Availible",
                                        textStyle: labelTextStyleBlackReguler16,
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        controller: ScrollController(),
                                        itemCount: HealthInauranceController
                                            .DocDownloadList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _url = Uri.parse(
                                                    HealthInauranceController
                                                            .DocDownloadList[
                                                        index]['documnet']);
                                                Future.delayed(
                                                    Duration(milliseconds: 100),
                                                    () {
                                                  _launchUrl(_url);
                                                });
                                              });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width: 43.h,
                                                    margin: EdgeInsets.only(
                                                        bottom: 0.9.h,
                                                        top: 0.5.h),
                                                    padding:
                                                        EdgeInsets.all(2.h),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        boxShadow:
                                                            commonboxshadow,
                                                        color:
                                                            Color(0xffF7F7F7)),
                                                    child: Row(children: [
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 1.h),
                                                          height: 3.h,
                                                          width: 3.h,
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf_rounded,
                                                            color: Colors.red,
                                                          )),
                                                      SizedBox(
                                                        height: 3.h,
                                                        width: 9.h,
                                                        child: CommonText(
                                                          label:
                                                              ' ${HealthInauranceController.DocDownloadList[index]['title']}',
                                                          maxLines: 1,
                                                          textStyle:
                                                              labelTextStyleBlackReguler14,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Icon(
                                                        Icons
                                                            .download_for_offline_sharp,
                                                        color: mainBlue,
                                                      )
                                                    ]))
                                              ],
                                            ),
                                          );
                                        },
                                      )
                              ],
                            );
                          }),
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
