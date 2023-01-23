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
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Color(0xff2479ab),
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
                SvgPicture.asset(
                  'assets/Images/Odin_Logo.svg',
                  height: 3.h,
                  width: 3.h,
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
                              ? Colors.grey
                              : Color(0xff1ba8d3),
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
                                          color: Color(0xff2479ab),
                                        ),
                                        child: CommonText(
                                          label:
                                              "${HomeController.notificationCount}",
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                              fontFamily: 'Poppins'),
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
          )),
          preferredSize: Size(100.h, 20.h)),
      body: UpgradeAlert(
        upgrader: Upgrader(
            durationUntilAlertAgain: Duration(minutes: 1),
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : UpgradeDialogStyle.material,
            showReleaseNotes: false,
            canDismissDialog: true),
        child: SafeArea(
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
                    children: [
                      FutureBuilder(
                        future: AccountController.UserDetailsFunction(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return AccountController.profileFullName == null
                              ? CustomLoader()
                              : Row(
                                  children: [
                                    CommonText(
                                      label: 'Welcome ',
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          color: Color(0xff333333)),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${AccountController.profileFullName}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            fontFamily: 'Poppins',
                                            color: Color(0xff333333)),
                                      ),
                                    ),
                                  ],
                                );
                        },
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      HomeMainModules(),
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
      ),
    );
  }

// home main modules

  HomeMainModules() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(HealthInsureSupportMainScreen(),
                transition: transitoineffect);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 7.h),
                width: 21.h,
                padding: EdgeInsets.all(1.3.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff0075B8),
                      Color(0xff0099CB),
                    ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Text(
                    'Know your Employee Benefits',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                ),
              ),
              Positioned(
                  top: 7.h,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe4e4e4),
                            blurRadius: 0,
                            spreadRadius: -9,
                            offset: Offset(-0, -0))
                      ],
                    ),
                    child: SvgPicture.asset(
                      'assets/Images/Employee Benefit Support.svg',
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // setState(() {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return WellnessComingSoon();
            //     },
            //   );
            // });
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 7.h),
                width: 21.h,
                padding: EdgeInsets.all(1.3.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff3E9E0B),
                      Color(0xffA8EB12),
                    ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Text(
                    'Explore Wellness\nCorner',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp),
                  ),
                ),
              ),
              Positioned(
                  top: 7.h,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe4e4e4),
                            blurRadius: 0,
                            spreadRadius: -9,
                            offset: Offset(-0, -0))
                      ],
                    ),
                    child: SvgPicture.asset(
                      'assets/Images/Wellness Corner.svg',
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          ),
        )
      ],
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
                          fontFamily: 'Poppins'),
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
                          fontFamily: 'Poppins'),
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
                          fontFamily: 'Poppins'),
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
                          fontFamily: 'Poppins'),
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
                          fontFamily: 'Poppins'),
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
                          fontFamily: 'Poppins'),
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
                          fontFamily: 'Poppins'),
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
