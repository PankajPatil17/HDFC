// ignore_for_file: invalid_return_type_for_catch_error, unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:sizer/sizer.dart';
import 'package:hdfc_bank/Controller/AccountController.dart';
import 'package:hdfc_bank/Controller/HomePageController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Generic/Custom/Custom_Drawer.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/DownloadForms.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/HealthInsureSupportMainScreen.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/IntimateClaim.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MembersCoverd.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MyCoverage.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MyclaimStatus.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/NetworkHospital.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/View_Summary.dart';
import 'package:hdfc_bank/Screens/NotificationScreen.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var changetabcolor;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    changetabcolor = 'Home';

    super.initState();
  }

  var AccountController = Get.put(MyAccountProfileController());
  var HomeController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(
              child: Container(
            height: 13.h,
            width: 100.h,
            padding: EdgeInsets.only(right: 1.2.h),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(
                            Icons.menu_rounded,
                            color: Color(0xffD82A1B),
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        );
                      },
                    ),
                    Image.asset(
                      'assets/Images/Hdfc_Logo.png',
                      height: 5.h,
                      width: 5.h,
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(NotificationScreen(),
                                  duration: Duration(milliseconds: 700),
                                  transition: Transition.circularReveal);
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: HomeController.notificationCount == 0 ||
                                      HomeController.notificationCount == null
                                  ? Color(0xffD82A1B)
                                  : Color(0xffD82A1B),
                            )),
                        FutureBuilder(
                          future: HomeController.NetworkHospitalImages(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return HomeController.notificationCount == 0 ||
                                    HomeController.notificationCount == null
                                ? const SizedBox.shrink()
                                : Positioned(
                                    top: 0.0,
                                    right: 1.0,
                                    child: HomeController.notificationCount == 0
                                        ? SizedBox.shrink()
                                        : Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffD82A1B),
                                            ),
                                            child: CommonText(
                                              label:
                                                  "${HomeController.notificationCount}",
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ),
                                  );
                          },
                        ),
                      ],
                    )
                    // SvgPicture.asset('assets/Images/Notification.svg'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome User',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 4.5.h,
                        width: 25.h,
                        padding: EdgeInsets.only(
                            bottom: 0.5.h, left: 1.h, right: 1.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 0.5, color: Color(0xffD82A1B))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                color: Color(0xffAAAAAA),
                                fontSize: 10.sp,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: SvgPicture.asset(
                                    'assets/Images/Search.svg'),
                              )),
                        ),
                      ),
                    ],
                  ),
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
              padding: EdgeInsets.only(
                top: 1.5.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HealthInsurance(),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    BannerImages(),
                    Container(
                      width: 100.h,
                      height: 15.h,
                      margin: EdgeInsets.only(bottom: 2.5.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'assets/Images/Banner2.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ClaimModules(),
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

// home main modules

  HealthInsurance() {
    return Container(
      padding: EdgeInsets.all(1.7.h),
      width: 100.h,
      color: pWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CommonText(
              label: 'Employee Benefit Support',
              textStyle: labelTextStyleBlackMedium16,
            ),
          )
        ],
      ),
    );
  }

// BANNER IMAGES

  BannerImages() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 2.5.h,
      ),
      height: 19.h,
      width: 70.h,
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'assets/Images/Banner.png',
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          pauseAutoPlayOnManualNavigate: true,
          pauseAutoPlayOnTouch: true,
          viewportFraction: 1,
          aspectRatio: 16 / 9,
          initialPage: 0,
          autoPlayInterval: Duration(seconds: 4),
        ),
      ),
    );
  }

// 6 MODULES CLAIMS
  ClaimModules() {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(bottom: 2.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/Images/claim_background_image.png'))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Get.to(ViewSummary(), transition: transitoineffect);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    top: 0.7, bottom: 0.7, left: 2.h, right: 2.h),
                margin: EdgeInsets.only(bottom: 2.5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 92, 188, 243),
                ),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(2.h),
                        height: 7.h,
                        width: 7.h,
                        child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/8282/8282341.png')),
                    CommonText(
                      label: 'View Policy Summary',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontFamily: 'Inter'),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: pWhite,
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
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
                          color: pWhite,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
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
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(NetworkHospital(), transition: transitoineffect);
                },
                child: Column(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.h,
                      margin: EdgeInsets.only(bottom: 0.8.h),
                      decoration: BoxDecoration(
                          color: pWhite,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      child: Center(
                        child: SvgPicture.asset(
                            height: 4.h,
                            color: mainBlue,
                            'assets/Images/Network_hospital.svg'),
                      ),
                    ),
                    Text(
                      'Network\nHospital',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Get.to(IntimateClaim(), transition: transitoineffect);
                  });
                },
                child: Column(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.h,
                      margin: EdgeInsets.only(bottom: 0.8.h),
                      decoration: BoxDecoration(
                          color: pWhite,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/Images/Intimate_my_claim.svg',
                          height: 4.h,
                          color: mainBlue,
                        ),
                      ),
                    ),
                    Text(
                      'Intimate\nMy Claims',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                          color: pWhite,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
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
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(MembersCoverd(), transition: transitoineffect);
                },
                child: Column(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.h,
                      margin: EdgeInsets.only(bottom: 0.8.h),
                      decoration: BoxDecoration(
                          color: pWhite,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      child: Center(
                        child: SvgPicture.asset(
                            height: 4.h,
                            color: mainBlue,
                            'assets/Images/Members_Covered.svg'),
                      ),
                    ),
                    Text(
                      'Members\nCovered',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(MyclaimStatus(), transition: transitoineffect);
                },
                child: Column(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.h,
                      margin: EdgeInsets.only(bottom: 0.8.h),
                      decoration: BoxDecoration(
                          color: pWhite,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
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
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
