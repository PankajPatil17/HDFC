import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Image.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:sizer/sizer.dart';

class MyCoverage extends StatefulWidget {
  const MyCoverage({super.key});

  @override
  State<MyCoverage> createState() => _MyCoverageState();
}

class _MyCoverageState extends State<MyCoverage> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
  TextEditingController coveragecontroller = TextEditingController();
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  SearchFunction() {
    final result = HealthInauranceController.myCoverageList.where((movie) {
      final movietitle = movie['label'].toString().toLowerCase();
      final input = coveragecontroller.text.toLowerCase();
      return movietitle.contains(input);
    }).toList();
    setState(() {
      HealthInauranceController.SearchResult = result;
    });
    // Future.delayed(Duration(seconds: 1), () {
    //   print(HealthInauranceController.SearchResult);
    // });
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
          child: FutureBuilder(
              future: HealthInauranceController.PolicyListingFunction(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
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
                                                                  .policyList[
                                                              index]);
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 5.h,
                                            width: 8.h,
                                            margin: EdgeInsets.only(left: 1.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
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
                                              maxLines: 1,
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color: HealthInauranceController
                                                              .indexvalue ==
                                                          HealthInauranceController
                                                              .policyList
                                                              .indexOf(
                                                                  HealthInauranceController
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
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Text(
                                'My Coverage',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    fontFamily: 'Inter',
                                    color: mainBlue),
                              ),
                              Container(
                                height: 6.5.h,
                                width: 100.h,
                                margin: EdgeInsets.symmetric(vertical: 1.2.h),
                                child: TextFormField(
                                  textInputAction: TextInputAction.search,
                                  onFieldSubmitted: (v) {
                                    Get.to(SearchFunction());
                                  },
                                  onChanged: (value) {
                                    SearchFunction();
                                  },
                                  controller: coveragecontroller,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 1.h, left: 1.h),
                                      hintText: 'Search Coverage',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xffb2b2b2),
                                          fontFamily: 'Inter'),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffe4e4e4),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffe4e4e4),
                                              width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      fillColor: Colors.white,
                                      suffixIcon: coveragecontroller.text == ''
                                          ? IconButton(
                                              padding: EdgeInsets.only(
                                                  bottom: 0.2.h),
                                              icon: Icon(
                                                Icons.search_rounded,
                                                color: Colors.grey.shade300,
                                                size: 3.h,
                                              ),
                                              onPressed: () {
                                                SearchFunction();
                                              },
                                            )
                                          : IconButton(
                                              padding: EdgeInsets.only(
                                                  bottom: 0.2.h),
                                              icon: Icon(
                                                Icons.clear_sharp,
                                                color: Colors.grey.shade300,
                                                size: 3.h,
                                              ),
                                              onPressed: () {
                                                SearchFunction();
                                                coveragecontroller.clear();
                                              },
                                            ),
                                      filled: true),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'To more about new feature click on  ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        fontFamily: 'Inter',
                                        color: Color(0xff363636)),
                                  ),
                                  SvgPicture.asset(
                                    'assets/Images/info.svg',
                                    color: mainBlue,
                                    height: 2.3.h,
                                  )
                                ],
                              ),
                              coveragecontroller.text == ''
                                  ? FutureBuilder(
                                      future: HealthInauranceController
                                          .PolicyMycoverageList(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<dynamic> snapshot) {
                                        return snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? CustomLoader()
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                controller: ScrollController(),
                                                itemCount:
                                                    HealthInauranceController
                                                        .myCoverageList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Container(
                                                    // height: 9.h,
                                                    width: 100.h,
                                                    margin: EdgeInsets.only(
                                                        bottom: 0.9.h,
                                                        top: 0.5.h),
                                                    padding:
                                                        EdgeInsets.all(1.5.h),
                                                    decoration: BoxDecoration(
                                                        boxShadow:
                                                            commonboxshadow,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color:
                                                            Color(0xffF7F7F7)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              HealthInauranceController
                                                                      .myCoverageList[
                                                                  index]['label'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color:
                                                                      mainBlue),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          Text(
                                                                        HealthInauranceController.myCoverageList[index]
                                                                            [
                                                                            'label'],
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize: 12
                                                                                .sp,
                                                                            color:
                                                                                mainBlue,
                                                                            fontFamily:
                                                                                'Inter'),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      content: Text(
                                                                          HealthInauranceController.myCoverageList[index]
                                                                              [
                                                                              'description'],
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 11.sp,
                                                                              color: Colors.black,
                                                                              fontFamily: 'Inter')),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: HealthInauranceController
                                                                              .myCoverageList[index]
                                                                          [
                                                                          'description'] ==
                                                                      ''
                                                                  ? Container()
                                                                  : SvgPicture
                                                                      .asset(
                                                                      'assets/Images/info.svg',
                                                                      color:
                                                                          mainBlue,
                                                                      height:
                                                                          2.3.h,
                                                                    ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          HealthInauranceController
                                                              .myCoverageList[
                                                                  index]
                                                                  ['value']
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 20,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                                  'Inter',
                                                              color: Color(
                                                                  0xff363636)),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                      })
                                  : HealthInauranceController
                                              .SearchResult.length ==
                                          0
                                      ? CommonImage(
                                          url:
                                              'https://media.tenor.com/unvXyxtdn3oAAAAC/no-result.gif')
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          controller: ScrollController(),
                                          itemCount: HealthInauranceController
                                              .SearchResult.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 9.h,
                                              width: 100.h,
                                              margin: EdgeInsets.only(
                                                  bottom: 0.9.h, top: 0.5.h),
                                              padding: EdgeInsets.all(1.h),
                                              decoration: BoxDecoration(
                                                  boxShadow: commonboxshadow,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xffF7F7F7)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        HealthInauranceController
                                                                .SearchResult[
                                                            index]['label'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 11.sp,
                                                            fontFamily: 'Inter',
                                                            color: mainBlue),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                  HealthInauranceController
                                                                              .SearchResult[
                                                                          index]
                                                                      ['label'],
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12.sp,
                                                                      color:
                                                                          mainBlue,
                                                                      fontFamily:
                                                                          'Inter'),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                content: Text(
                                                                    HealthInauranceController
                                                                            .SearchResult[index]
                                                                        [
                                                                        'description'],
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize: 11
                                                                            .sp,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Inter')),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: HealthInauranceController
                                                                            .SearchResult[
                                                                        index][
                                                                    'description'] ==
                                                                ''
                                                            ? Container()
                                                            : SvgPicture.asset(
                                                                'assets/Images/info.svg',
                                                                color: mainBlue,
                                                                height: 2.3.h,
                                                              ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    HealthInauranceController
                                                        .SearchResult[index]
                                                            ['value']
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10.sp,
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xff363636)),
                                                  ),
                                                ],
                                              ),
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
                );
              })),
    );
  }
}
