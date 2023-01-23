// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dotted_border/dotted_border.dart';

class ShareYourDocuments extends StatefulWidget {
  const ShareYourDocuments({super.key});

  @override
  State<ShareYourDocuments> createState() => _ShareYourDocumentsState();
}

class _ShareYourDocumentsState extends State<ShareYourDocuments> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changetabcolor;
  FilePickerResult? result;
  var imgpath;
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  void url() {
    String phone = '+918779534228';
    String message = 'Please Share Your Documents';
    if (Platform.isAndroid) {
      // add the [https]
      launch("https://wa.me/$phone/?text=${Uri.parse(message)}"); // new line
    } else {
      // add the [https]
      launch("https://wa.me/$phone/?text=${Uri.parse(message)}"); // new line
    }
  }

  uploadButton() {
    var uploadingFile = false.obs;
    return Obx(() {
      return uploadingFile.value
          ? CustomLoader()
          : GestureDetector(
              onTap: () async {
                uploadingFile.value = true;
                result = await FilePicker.platform.pickFiles();
                if (result == null) {
                  uploadingFile.value = false;
                  return;
                }
                imgpath = result!.files[0].path;
                await HealthInauranceController.UploadDocument(img: imgpath);
                uploadingFile.value = false;
              },
              child: Container(
                  margin: EdgeInsets.only(top: 1.5.h),
                  padding: EdgeInsets.all(1.5.h),
                  width: 100.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload document',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Inter',
                            color: Color(0xff363636)),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      DottedBorder(
                        color: Color(0xffC5C5C5),
                        strokeWidth: 1,
                        dashPattern: [9, 10],
                        child: Container(
                          height: 9.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/Images/Upload.svg'),
                              Text(
                                '   Browse file',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.sp,
                                    fontFamily: 'Inter',
                                    color: Color(0xff363636)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
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
                      Text(
                        'Share documents',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                            color: Color(0xff338EC0)),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text(
                        'Dear customer upload your medical document',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            color: Color(0xff363636)),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      uploadButton(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Share with',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            color: Color(0xff363636)),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                path: 'support@medibhai.com',
                                query: encodeQueryParameters(<String, String>{
                                  'subject': 'Uploading Documents',
                                }),
                              );

                              launchUrl(emailLaunchUri);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 9.h,
                                  width: 9.h,
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black12,
                                            spreadRadius: 2)
                                      ]),
                                  padding: EdgeInsets.all(2.h),
                                  child: SvgPicture.asset(
                                      'assets/Images/Email.svg'),
                                ),
                                Text(
                                  'Email',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      fontFamily: 'Inter',
                                      color: Color(0xff363636)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                url();
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 9.h,
                                  width: 9.h,
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black12,
                                            spreadRadius: 2)
                                      ]),
                                  padding: EdgeInsets.all(2.h),
                                  child: SvgPicture.asset(
                                      'assets/Images/Whatsapp_green.svg'),
                                ),
                                Text(
                                  'Whatsapp',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      fontFamily: 'Inter',
                                      color: Color(0xff363636)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch("tel: +91 8779534228");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 9.h,
                                  width: 9.h,
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black12,
                                            spreadRadius: 2)
                                      ]),
                                  padding: EdgeInsets.all(2.h),
                                  child: SvgPicture.asset(
                                      'assets/Images/Call.svg'),
                                ),
                                Text(
                                  'Call Me',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      fontFamily: 'Inter',
                                      color: Color(0xff363636)),
                                ),
                              ],
                            ),
                          ),
                        ],
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
