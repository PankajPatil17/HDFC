// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controller/SignUpController.dart';

class NetworkHospital extends StatefulWidget {
  const NetworkHospital({super.key});

  @override
  State<NetworkHospital> createState() => _NetworkHospitalState();
}

class _NetworkHospitalState extends State<NetworkHospital> {
  var SignUpcontroller = Get.put(SignUpController());
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
  String? state;
  var stateName;
  String? city;
  var cityName;
  TextEditingController hospitalname = TextEditingController();
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  List HospitalList = [].obs;
  Future SearchHospitalList() async {
    final response = await http.post(
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/tpahospital'),
        body: {
          "state": stateName == null ? '' : stateName.toString(),
          "city": city == null ? '' : city.toString(),
          "tpa_id": HealthInauranceController.tpaid.toString(),
          "txt_hospital_name": hospitalname.text,
          "insurer_id": HealthInauranceController.insurerId.toString(),
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
        });
    var decodedResponse = json.decode(response.body);
    setState(() {
      HospitalList = decodedResponse['hospital'];
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
                          future:
                              HealthInauranceController.PolicyListingFunction(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return Row(
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                                                            .policyList[index]);
                                          });
                                        },
                                        child: HealthInauranceController
                                                            .policyList[index]
                                                        ['policy_type'] ==
                                                    'GPA' ||
                                                HealthInauranceController
                                                            .policyList[index]
                                                        ['policy_type'] ==
                                                    'GTL'
                                            ? Container()
                                            : Container(
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
                                                        width: 1.5,
                                                        color:
                                                            Color(0xffe4e4e4)),
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
                        'Network Hospital',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                            color: mainBlue),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text(
                          'Search Cashless Hospital',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              fontFamily: 'Inter',
                              color: Colors.black),
                        ),
                      ),
                      Text(
                        '( These hospitals provide cashless facility for this policy)',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Inter',
                            color: Colors.grey.shade500),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Material(
                        elevation: 3.0,
                        shadowColor: Colors.white,
                        child: TextFormField(
                          // validator: (v) {
                          //   if (v == null || v.isEmpty) {
                          //     return 'The Mobile Number field is required';
                          //   }
                          //   return null;
                          // },
                          controller: hospitalname,

                          decoration: InputDecoration(
                              hintText: 'Hospital Name',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black26,
                                  fontFamily: 'Inter'),
                              contentPadding: EdgeInsets.all(2.h),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.5),
                                  borderRadius: BorderRadius.circular(6)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.5),
                                  borderRadius: BorderRadius.circular(6)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.5),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.5),
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Center(
                        child: CommonText(
                          label: 'Or',
                          textStyle: labelTextStyleGreyReguler16,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        width: 100.h,
                        margin: EdgeInsets.only(top: 0.5.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffe4e4e4).withOpacity(0.5),
                              spreadRadius: 1.5,
                              blurRadius: 0.5,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.h, right: 1.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: CommonText(
                                  label: 'Select State',
                                  textStyle: TextStyle(
                                      color: Color(0xffb2b2b2),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: 'Inter'),
                                ),
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: state,
                              items: HealthInauranceController.AllStateList.map(
                                  (item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {
                                      stateName = item;
                                    },
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  state = _v!;
                                });
                              }),
                        ),
                      ),
                      FutureBuilder(
                        future: HealthInauranceController.GetcityFunction(
                            stateName),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return Container(
                            alignment: Alignment.center,
                            height: 6.h,
                            width: 100.h,
                            margin: EdgeInsets.only(top: 1.5.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffe4e4e4).withOpacity(0.5),
                                  spreadRadius: 1.5,
                                  blurRadius: 0.5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 1.h, right: 1.h),
                              child: DropdownButton(
                                  focusColor: Colors.white,
                                  menuMaxHeight: 300.0,
                                  isExpanded: true,
                                  isDense: true,
                                  hint: Padding(
                                    padding: EdgeInsets.only(top: 2.0),
                                    child: CommonText(
                                      label: 'Select city',
                                      textStyle: TextStyle(
                                          color: Color(0xffb2b2b2),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: 'Inter'),
                                    ),
                                  ),
                                  underline: Container(
                                    color: Colors.white,
                                  ),
                                  value: city,
                                  items: HealthInauranceController.CityNamelist
                                      .map((item) {
                                    return DropdownMenuItem(
                                        enabled: true,
                                        onTap: () {
                                          cityName = item['city'];
                                        },
                                        value: item['city'].toString(),
                                        child: Text(
                                          item['city'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              overflow: TextOverflow.ellipsis),
                                        ));
                                  }).toList(),
                                  onChanged: (String? _v) {
                                    setState(() {
                                      city = _v!;
                                    });
                                  }),
                            ),
                          );
                        },
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              SearchHospitalList();
                              Future.delayed(Duration(seconds: 1), () {
                                stateName = '';
                                cityName = '';
                                hospitalname.clear();
                              });
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 6.5.h,
                            width: 16.h,
                            margin: EdgeInsets.only(top: 2.5.h, bottom: 2.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 1.5, color: Color(0xffe4e4e4)),
                              color: mainBlue,
                            ),
                            child: CommonText(
                              label: 'Search',
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: SearchHospitalList(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return ListView.builder(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            itemCount: HospitalList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.all(0.3.h),
                                margin: EdgeInsets.only(bottom: 1.4.h),
                                decoration: BoxDecoration(
                                    color: Color(0xffF7F7F7),
                                    boxShadow: commonboxshadow),
                                child: Theme(
                                  data: ThemeData().copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    title: CommonText(
                                      label:
                                          "${HospitalList[index]['hospital_name']}",
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: mainBlue,
                                          fontFamily: 'Inter'),
                                      maxLines: 1,
                                    ),
                                    children: [
                                      Container(
                                        // height: 46.2.h,
                                        width: 100.h,
                                        margin: EdgeInsets.only(
                                          bottom: 1.4.h,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: 1.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF7F7F7),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label: 'Hospital Name :',
                                                      maxLines: 1,
                                                      textStyle:
                                                          labelTextStyleBlackMedium14),
                                                ),
                                                Expanded(
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['hospital_name']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label:
                                                          'Hospital Address :',
                                                      maxLines: 1,
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Inter')),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                  width: 23.h,
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['hospital_address']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label: 'Location:',
                                                      maxLines: 1,
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Inter')),
                                                ),
                                                SizedBox(
                                                  width: 23.h,
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['location']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label: 'Landmark:',
                                                      maxLines: 1,
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Inter')),
                                                ),
                                                SizedBox(
                                                  width: 23.h,
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['landmark']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label: 'City:',
                                                      maxLines: 1,
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Inter')),
                                                ),
                                                SizedBox(
                                                  width: 23.h,
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['city']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label: 'State:',
                                                      maxLines: 1,
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Inter')),
                                                ),
                                                SizedBox(
                                                  width: 23.h,
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['state']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 15.h,
                                                  child: CommonText(
                                                      label: 'Pincode:',
                                                      maxLines: 1,
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11.sp,
                                                          fontFamily: 'Inter')),
                                                ),
                                                SizedBox(
                                                  width: 23.h,
                                                  child: CommonText(
                                                    label: HospitalList[index]
                                                            ['pincode']
                                                        .toString(),
                                                    maxLines: 2,
                                                    textStyle:
                                                        labelTextStyleBlackReguler12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            GestureDetector(
                                              onTap: () {
                                                String? encodeQueryParameters(
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
                                                final Uri emailLaunchUri = Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                      '${HospitalList[index]['email']}',
                                                  query: encodeQueryParameters(<
                                                      String, String>{
                                                    'subject': 'Any Help',
                                                  }),
                                                );

                                                launchUrl(emailLaunchUri);
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 15.h,
                                                    child: CommonText(
                                                        label: 'Email:',
                                                        maxLines: 1,
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 11.sp,
                                                            fontFamily:
                                                                'Inter')),
                                                  ),
                                                  SizedBox(
                                                    width: 23.h,
                                                    child: CommonText(
                                                      label: HospitalList[index]
                                                              ['email']
                                                          .toString(),
                                                      maxLines: 2,
                                                      textStyle:
                                                          labelTextStyleBlackReguler12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  launch(
                                                      'tel: ${HospitalList[index]['phone'].toString()}');
                                                });
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 15.h,
                                                    child: CommonText(
                                                        label: 'Phone:',
                                                        maxLines: 1,
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 11.sp,
                                                            fontFamily:
                                                                'Inter')),
                                                  ),
                                                  SizedBox(
                                                    width: 23.h,
                                                    child: CommonText(
                                                      label: HospitalList[index]
                                                              ['phone']
                                                          .toString(),
                                                      maxLines: 2,
                                                      textStyle:
                                                          labelTextStyleBlackReguler12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
        )));
  }
}
