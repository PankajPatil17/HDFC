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

class MembersCoverd extends StatefulWidget {
  const MembersCoverd({super.key});

  @override
  State<MembersCoverd> createState() => _MembersCoverdState();
}

class _MembersCoverdState extends State<MembersCoverd> {
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
                  Image.asset(
                    'assets/Images/Hdfc_Logo.png',
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
                                              child: HealthInauranceController
                                                                      .policyList[
                                                                  index]
                                                              ['policy_type'] ==
                                                          'GPA' ||
                                                      HealthInauranceController
                                                                      .policyList[
                                                                  index]
                                                              ['policy_type'] ==
                                                          'GTL'
                                                  ? Container()
                                                  : Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 5.h,
                                                      width: 8.h,
                                                      margin: EdgeInsets.only(
                                                          left: 1.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
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
                                                              : Colors
                                                                  .transparent),
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
                                                                        .indexOf(HealthInauranceController.policyList[
                                                                            index])
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontFamily:
                                                                'Inter'),
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
                        'Members Covered',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                            color: mainBlue),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      FutureBuilder(
                          future: HealthInauranceController.MembersCovered(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? CustomLoader()
                                : ListView.builder(
                                    itemCount: HealthInauranceController
                                        .memebrscovered.length,
                                    controller: ScrollController(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        width: 100.h,
                                        margin: EdgeInsets.only(
                                            bottom: 1.h, top: 1.h),
                                        padding: EdgeInsets.all(2.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: DropShadow,
                                            boxShadow: commonboxshadow),
                                        child: Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                  height: 8.h,
                                                  'https://cdn-icons-png.flaticon.com/128/3135/3135715.png'),
                                            ),
                                            SizedBox(
                                              width: 2.h,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${HealthInauranceController.memebrscovered[index]['relationship_name']}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 11.sp,
                                                      fontFamily: 'Inter',
                                                      color: Color(0xff363636)),
                                                ),
                                                SizedBox(
                                                  height: 0.2.h,
                                                ),
                                                Text(
                                                  "${HealthInauranceController.memebrscovered[index]['relationship_user']}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      fontFamily: 'Inter',
                                                      color: Color(0xff363636)),
                                                ),
                                                Text(
                                                  'Age: ${HealthInauranceController.memebrscovered[index]['age']}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      fontFamily: 'Inter',
                                                      color: Color(0xff363636)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                          }),
                      FutureBuilder(
                          future: HealthInauranceController.CashlessCards(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? CustomLoader()
                                : ListView.builder(
                                    itemCount:
                                        HealthInauranceController.cards.length,
                                    controller: ScrollController(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _url = Uri.parse(
                                                HealthInauranceController
                                                        .cards[index]
                                                    ['health_card_path']);
                                            Future.delayed(
                                                Duration(milliseconds: 100),
                                                () {
                                              _launchUrl(_url);
                                            });
                                          });
                                        },
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 1.5.h,
                                                right: 1.5.h,
                                                left: 1.5.h,
                                                top: 2.h),
                                            padding: EdgeInsets.all(1.5.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: mainBlue),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Images/download.svg'),
                                                SizedBox(
                                                  width: 1.5.h,
                                                ),
                                                Text(
                                                  'Download cashless cards',
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.sp,
                                                      color: Colors.white,
                                                      fontFamily: 'Inter'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                          })
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
