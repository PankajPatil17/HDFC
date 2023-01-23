import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/AccountController.dart';
import 'package:odin/Controller/HomePageController.dart';
import 'package:odin/Generic/Common/CommonBottomBar.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:odin/Generic/Common/WatchYouTube.dart';
import 'package:odin/Generic/Constant/colors.dart';
import 'package:sizer/sizer.dart';

class WellnessCorner extends StatefulWidget {
  const WellnessCorner({super.key});

  @override
  State<WellnessCorner> createState() => _WellnessCornerState();
}

var changetabcolor;

class _WellnessCornerState extends State<WellnessCorner> {
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  var HomeController = Get.put(HomePageController());
  var AccountController = Get.put(MyAccountProfileController());

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
                BackButton(
                  color: Color(0xff2479ab),
                ),
                SvgPicture.asset(
                  'assets/Images/Odin_Logo.svg',
                  height: 3.h,
                  width: 3.h,
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
                  children: [
                    BannerImages(),
                    FirstThreeModules(),
                    Container(
                      width: 100.h,
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      child: SvgPicture.asset(
                        'assets/Images/package_card.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SecondThreeModules(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Videos(),
                    SizedBox(
                      height: 2.h,
                    ),
                    HealthModules(),
                    SizedBox(
                      height: 2.h,
                    ),
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

  // BANNER IMAGE
  BannerImages() {
    return Container(
      margin:
          EdgeInsets.only(bottom: 2.2.h, left: 1.5.h, right: 1.5.h, top: 2.2.h),
      height: 19.h,
      width: 70.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 2))
      ]),
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
                'assets/Images/Wellness_Banner.png',
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
          enlargeCenterPage: true,
          initialPage: 0,
          autoPlayInterval: Duration(seconds: 4),
        ),
      ),
    );
  }

// MediBhai Modules

  FirstThreeModules() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
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
                        height: 4.h, 'assets/Images/Teleconsultation.svg'),
                  ),
                ),
                Text(
                  'Teleconsult',
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
            onTap: () {},
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
                        height: 4.h, 'assets/Images/Diagnostics.svg'),
                  ),
                ),
                Text(
                  'Diagnostics',
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
              setState(() {});
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
                      'assets/Images/Medicine.svg',
                      height: 4.h,
                    ),
                  ),
                ),
                Text(
                  'Medicine',
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
    );
  }

  SecondThreeModules() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
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
                    child:
                        SvgPicture.asset(height: 4.h, 'assets/Images/OPD.svg'),
                  ),
                ),
                Text(
                  'OPD',
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
            onTap: () {},
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
                    child:
                        SvgPicture.asset(height: 4.h, 'assets/Images/IPD.svg'),
                  ),
                ),
                Text(
                  'IPD',
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
              setState(() {});
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
                      'assets/Images/Nutrition.svg',
                      height: 4.h,
                    ),
                  ),
                ),
                Text(
                  'Nutrition',
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
    );
  }

//CARD DETAILS

  ActivePackageCard() {
    return Container(
      height: 23.h,
      width: 100.h,
      padding: EdgeInsets.all(3.h),
      margin: EdgeInsets.only(bottom: 3.h, top: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/Images/Active_Package_Card.png'))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SvgPicture.asset('assets/Images/Odin_Logo.svg'),
          Padding(
            padding: EdgeInsets.only(
              top: 1.5.h,
            ),
            child: SizedBox(
              width: 27.h,
              child: CommonText(
                label: 'Gold Package',
                maxLines: 1,
                textStyle: TextStyle(
                    color: mainBlue,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 27.h,
            child: FutureBuilder(
              future: AccountController.UserDetailsFunction(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return CommonText(
                  label: '${AccountController.profileFullName}',
                  maxLines: 1,
                  textStyle: TextStyle(
                      color: mainBlue,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp),
                );
              },
            ),
          ),
          SizedBox(
            height: 1.3.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonText(
                label: 'Valid till',
                textStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 1.h,
              ),
              SizedBox(
                width: 27.h,
                child: CommonText(
                  label: '09/2023',
                  maxLines: 1,
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Videos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          label: 'Health Talk',
          textStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Poppins'),
        ),
        Container(
          height: 20.0.h,
          margin: EdgeInsets.only(bottom: 1.5.h, top: 2.0.h),
          child: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  right: 1.5.h,
                  bottom: 1.5.h,
                ),
                height: 14.h,
                width: 22.h,
                padding: EdgeInsets.all(1.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Color(0xffe4e4e4)),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffe4e4e4).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1.5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return WacthyoutubeVideo(
                              url: 'MnHrcN5mqbo',
                              title:
                                  'Medibhai full body check up with vitamin Screenin..',
                            );
                          },
                        );
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 10.h,
                            width: 22.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              child: Image.network(
                                'https://medibhai.com/assets/responsive/images/thumbnail.jpg',
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp),
                          'Medibhai full body check up with vitamin Screenin..',
                        ),
                      ],
                    )),
              );
            },
          ),
        )
      ],
    );
  }

  HealthModules() {
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(image: AssetImage('assets/Images/image.png'))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            label: 'Always remain healthy with',
            textStyle: labelTextStyleBlackReguler14,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 12.h,
                      width: 12.h,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.asset('assets/Images/Yoga.png')),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  CommonText(
                    label: 'Yoga',
                    textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: Colors.black),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 12.h,
                      width: 12.h,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                          'assets/Images/Nutrition_Consultation.png')),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  CommonText(
                    label: 'Nutrition consultation',
                    textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: Colors.black),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
