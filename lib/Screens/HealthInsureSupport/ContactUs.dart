// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

var changetabcolor = 'Support';

class _ContactUsState extends State<ContactUs> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  @override
  void initState() {
    changetabcolor = 'Support';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
              ],
            ),
          )),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(1.6.h),
              width: 100.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          color: mainBlue),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    FutureBuilder(
                      future: HealthInauranceController.ContactUsFunction(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? CustomLoader()
                            : ListView.builder(
                                itemCount: HealthInauranceController
                                    .ContactList.length,
                                shrinkWrap: true,
                                controller: ScrollController(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 1.8.h),
                                    padding: EdgeInsets.all(1.2.h),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xffD1EEFF),
                                        Color(0xffF3F9FC),
                                      ]),
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: commonboxshadow,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  label: 'Name  : ',
                                                  textStyle:
                                                      labelTextStyleBlackMedium16,
                                                ),
                                                CommonText(
                                                  label:
                                                      '${HealthInauranceController.ContactList[index]['full_name']}',
                                                  textStyle:
                                                      labelTextStyleBlackReguler16,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  label: 'Phone : ',
                                                  textStyle:
                                                      labelTextStyleBlackMedium16,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      launch(
                                                        'tel: ${HealthInauranceController.ContactList[index]['mobile_number']}',
                                                      );
                                                    });
                                                  },
                                                  child: CommonText(
                                                    label:
                                                        '${HealthInauranceController.ContactList[index]['mobile_number']}',
                                                    textStyle:
                                                        labelTextStyleBlueReguler16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  label: 'Email  : ',
                                                  textStyle:
                                                      labelTextStyleBlackMedium16,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    String?
                                                        encodeQueryParameters(
                                                            Map<String, String>
                                                                params) {
                                                      return params.entries
                                                          .map((MapEntry<String,
                                                                      String>
                                                                  e) =>
                                                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                          .join('&');
                                                    }

                                                    // ···
                                                    final Uri emailLaunchUri =
                                                        Uri(
                                                      scheme: 'mailto',
                                                      path:
                                                          '${HealthInauranceController.ContactList[index]['email_id']}',
                                                      query:
                                                          encodeQueryParameters(<
                                                              String, String>{
                                                        'subject': 'Contact Us',
                                                      }),
                                                    );

                                                    launchUrl(emailLaunchUri);
                                                  },
                                                  child: CommonText(
                                                    label:
                                                        '${HealthInauranceController.ContactList[index]['email_id']}',
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xff2479ab),
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  label: 'Address : ',
                                                  textStyle:
                                                      labelTextStyleBlackMedium16,
                                                ),
                                                SizedBox(
                                                  width: 21.5.h,
                                                  child: CommonText(
                                                    label:
                                                        '${HealthInauranceController.ContactList[index]['full_address']}',
                                                    maxLines: 5,
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11.sp,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(1.1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Color(0xff338EC0)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              CommonText(
                                                label: 'Level  : ',
                                                textStyle:
                                                    labelTextStyleWhiteMedium16,
                                              ),
                                              CommonText(
                                                label:
                                                    '${HealthInauranceController.ContactList[index]['user_level']}',
                                                textStyle:
                                                    labelTextStyleWhiteReguler16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
      )),
    );
  }
}
