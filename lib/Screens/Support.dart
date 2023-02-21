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

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var changetabcolor;

  @override
  void initState() {
    changetabcolor = 'Support';
    super.initState();
  }

  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
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
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded)),
                Image.asset(
                  'assets/Images/Hdfc_Logo.png',
                  height: 5.h,
                  width: 5.h,
                ),
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
              width: 100.h,
              padding: EdgeInsets.only(top: 1.5.h, left: 1.5.h, right: 1.5.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Contact()],
                ),
              ),
            ),
          ),
          CommonBottomBar(changetabcolor: changetabcolor)
        ],
      )),
    );
  }

  Contact() {
    return FutureBuilder(
      future: HealthInauranceController.ContactUsFunction(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          Center(child: CustomLoader());
        }

        return HealthInauranceController.ContactList.length == 0 ||
                // ignore: unnecessary_null_comparison
                HealthInauranceController.ContactList.length == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: SvgPicture.asset('assets/Images/Support img.svg')),
                  Padding(
                    padding: EdgeInsets.only(top: 3.5.h, bottom: 3.h),
                    child: CommonText(
                      label: 'Contact us',
                      textStyle: TextStyle(
                          color: mainBlue,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/Images/location.svg'),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: CommonText(
                          label:
                              'Phoenix paragon plaza, 1B-100, Next to Phoenix Market City, LBS Rd, Kamani, Kurla West, Mumbai, Maharashtra 400070',
                          maxLines: 6,
                          textStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: GestureDetector(
                      onTap: () {
                        launch("tel: +91 8779534228");
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/Images/support_call.svg'),
                          SizedBox(
                            width: 1.h,
                          ),
                          CommonText(
                            label: '+91 8282252245',
                            maxLines: 6,
                            textStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: mainBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
//                   GestureDetector(
//                     onTap: () {
//                       String? encodeQueryParameters(
//                           Map<String, String> params) {
//                         return params.entries
//                             .map((MapEntry<String, String> e) =>
//                                 '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//                             .join('&');
//                       }

// // ···
//                       final Uri emailLaunchUri = Uri(
//                         scheme: 'mailto',
//                         path: 'abc@enirmaan.com',
//                         query: encodeQueryParameters(<String, String>{
//                           'subject': 'Any Support',
//                         }),
//                       );

//                       launchUrl(emailLaunchUri);
//                     },
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SvgPicture.asset('assets/Images/support_email.svg'),
//                         SizedBox(
//                           width: 1.h,
//                         ),
//                         CommonText(
//                           label: 'abc@enirmaan.com',
//                           maxLines: 6,
//                           textStyle: TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: 11.sp,
//                               fontWeight: FontWeight.w400,
//                               color: mainBlue),
//                         ),
//                       ],
//                     ),
//                   ),
                ],
              )
            : ListView.builder(
                itemCount: HealthInauranceController.ContactList.length,
                shrinkWrap: true,
                controller: ScrollController(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 1.8.h),
                    padding: EdgeInsets.all(1.2.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFECBC6), Color(0xffFFFFFF)]),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: commonboxshadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      label: 'Name  : ',
                                      textStyle: labelTextStyleBlackMedium16,
                                    ),
                                    CommonText(
                                      label:
                                          '${HealthInauranceController.ContactList[index]['full_name']}',
                                      textStyle: labelTextStyleBlackReguler16,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      label: 'Phone : ',
                                      textStyle: labelTextStyleBlackMedium16,
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
                                        maxLines: 2,
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                            color: Color(0xff2479AB),
                                            fontFamily: 'Inter'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(1.1.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xffFFE1E1)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  CommonText(
                                    label: 'Level  : ',
                                    textStyle: labelTextStyleBlackMedium16,
                                  ),
                                  CommonText(
                                    label:
                                        '${HealthInauranceController.ContactList[index]['user_level']}',
                                    textStyle: labelTextStyleBlackReguler16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              label: 'Email  : ',
                              textStyle: labelTextStyleBlackMedium16,
                            ),
                            GestureDetector(
                              onTap: () {
                                String? encodeQueryParameters(
                                    Map<String, String> params) {
                                  return params.entries
                                      .map((MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                      .join('&');
                                }

                                // ···
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path:
                                      '${HealthInauranceController.ContactList[index]['email_id']}',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': 'Contact Us',
                                  }),
                                );

                                launchUrl(emailLaunchUri);
                              },
                              child: CommonText(
                                label:
                                    '${HealthInauranceController.ContactList[index]['email_id']}',
                                maxLines: 2,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Color(0xff2479ab),
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              label: 'Address : ',
                              textStyle: labelTextStyleBlackMedium16,
                            ),
                            Expanded(
                              child: CommonText(
                                label:
                                    '${HealthInauranceController.ContactList[index]['full_address']}',
                                maxLines: 5,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Colors.black,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
