// ignore_for_file: invalid_return_type_for_catch_error, unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Screens/OnBoarding/WebViewScreen.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/HealthInsuranceMainScreen.dart';

import 'package:sizer/sizer.dart';
import 'package:hdfc_bank/Controller/AccountController.dart';
import 'package:hdfc_bank/Controller/HomePageController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Generic/Custom/Custom_Drawer.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/DownloadForms.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/IntimateClaim.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MembersCoverd.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MyCoverage.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/MyclaimStatus.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/NetworkHospital.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/View_Summary.dart';
import 'package:hdfc_bank/Screens/NotificationScreen.dart';

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

  final ScrollController _controller = ScrollController();
  _scrollDown() {
    setState(() {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  runscroll() async {
    await _scrollDown();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    runscroll();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
                    ValidateNow(),
                    PersonalInsurance(),
                    ActivateNow(),
                    Container(
                      width: 100.h,
                      height: 15.h,
                      margin: EdgeInsets.only(bottom: 2.5.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SvgPicture.asset(
                          'assets/Images/banner2.svg',
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
      margin: EdgeInsets.only(
        top: 1.5.h,
      ),
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
          ),
          Container(
            margin: EdgeInsets.only(top: 2.2.h),
            height: 15.h,
            width: 100.h,
            child: ListView.builder(
              itemCount: HomeController.HealthName.length,
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 2.5.h),
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.to(ViewSummary(), transition: transitoineffect);
                      } else if (index == 1) {
                        Get.to(MyCoverage(), transition: transitoineffect);
                      }
                      if (index == 2) {
                        Get.to(NetworkHospital(), transition: transitoineffect);
                      }
                      if (index == 3) {
                        Get.to(IntimateClaim(), transition: transitoineffect);
                      }
                      if (index == 4) {
                        Get.to(DownloadForms(), transition: transitoineffect);
                      }
                      if (index == 5) {
                        Get.to(MembersCoverd(), transition: transitoineffect);
                      }
                      if (index == 6) {
                        Get.to(MyclaimStatus(), transition: transitoineffect);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.5.h),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: pWhite,
                              boxShadow: commonboxshadow),
                          child: SvgPicture.asset(
                            '${HomeController.HealthImage[index]}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          '${HomeController.HealthName[index]}',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  PersonalInsurance() {
    return Container(
      width: 100.h,
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFECBC6), Color(0xffFFFFFF)])),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                    decoration: BoxDecoration(
                        color: pWhite,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/Images/car.svg'),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Car',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(HealthInsuranceMainScreen());
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                      decoration: BoxDecoration(
                          color: pWhite,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/Images/health.svg'),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Health',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                    decoration: BoxDecoration(
                        color: pWhite,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/Images/life.svg'),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Life',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                    decoration: BoxDecoration(
                        color: pWhite,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/Images/personal_home.svg'),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(3.5.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: pWhite,
              shape: BoxShape.circle,
              boxShadow: commonboxshadow,
            ),
            child: Text(
              'Personal\nInsurance',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: mainBlue,
                  fontFamily: 'Inter',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  ValidateNow() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      width: 100.h,
      child: SvgPicture.asset('assets/Images/valiatenow.svg'),
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
        itemCount: HomeController.BannerImages.length,
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
                '${HomeController.BannerImages[index]}',
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
          autoPlayInterval: Duration(minutes: 1),
        ),
      ),
    );
  }

  ActivateNow() {
    return GestureDetector(
      onTap: () {
        Get.to(WebviewScreen(
          url: 'https://www.medibhai.com/health-package/520',
          labelname: 'Activate Now',
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        width: 100.h,
        child: SvgPicture.asset('assets/Images/activenow.svg'),
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
          gradient: LinearGradient(colors: [
            Color(0xffCEFFFA),
            Color(0xffffffff),
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CommonText(
              label: 'Wellness corner',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontFamily: 'Inter'),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    WebviewScreen(
                      url: 'https://app.medibhai.com/teleconsult',
                      labelname: 'Teleconsultation',
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 12.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                height: 4.h, 'assets/Images/Teleconsult.svg'),
                          ),
                          Text(
                            'Teleconsult',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    WebviewScreen(
                      url: 'https://app.medibhai.com/medicine',
                      labelname: 'Medicine',
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 12.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                height: 4.h, 'assets/Images/Medicine.svg'),
                          ),
                          Text(
                            'Medicine',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Get.to(
                      WebviewScreen(
                        url: 'https://app.medibhai.com/diagnostics',
                        labelname: '',
                      ),
                    );
                  });
                },
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 12.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                height: 4.h, 'assets/Images/Diagnostics.svg'),
                          ),
                          Text(
                            'Diagnostics',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 12.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                height: 4.h, 'assets/Images/Nutrition.svg'),
                          ),
                          Text(
                            'Nutrition',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    WebviewScreen(
                      url: 'https://medibhai.com/doctors',
                      labelname: '',
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 12.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                height: 4.h, 'assets/Images/Doctor.svg'),
                          ),
                          Text(
                            'Doctor',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                      WebviewScreen(
                        url: 'https://medibhai.com/hospitals',
                        labelname: '',
                      ),
                      transition: transitoineffect);
                },
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 12.h,
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                height: 4.h, 'assets/Images/Hospital.svg'),
                          ),
                          Text(
                            'Hospital',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
