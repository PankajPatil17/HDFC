// ignore_for_file: invalid_return_type_for_catch_error, unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Screens/Complete_Enrollment.dart/CompleteEnrollment.dart';
import 'package:hdfc_bank/Screens/OnBoarding/WebViewScreen.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/HealthInsurerGroupsMainScreenFirst.dart';
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
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
  }

  runscroll() async {
    await _scrollDown();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(
              child: Container(
            height: 13.h,
            width: 100.h,
            padding: EdgeInsets.only(right: 1.2.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffFECBC6),
                      blurRadius: 2,
                      offset: Offset(0, 2))
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
          child: FutureBuilder(
        future: HomeController.gethomescreenUiData(),
        builder: (context, snapshot) {
          return Column(
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
                        HomeController.GetAllHomeScrenUidata['section_details']
                                    [0]['section_status'] ==
                                0
                            ? Container()
                            : HealthInsurance(),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        HomeController.GetAllHomeScrenUidata['section_details']
                                    [5]['section_status'] ==
                                0
                            ? Container()
                            : BannerImages(),
                        HomeController.GetAllHomeScrenUidata['section_details']
                                    [4]['section_status'] ==
                                0
                            ? Container()
                            : ValidateNow(),
                        HomeController.GetAllHomeScrenUidata['section_details']
                                    [1]['section_status'] ==
                                0
                            ? Container()
                            : PersonalInsurance(),
                        HomeController.GetAllHomeScrenUidata['section_details']
                                    [2]['section_status'] ==
                                0
                            ? Container()
                            : ActivateNow(),
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
                        HomeController.GetAllHomeScrenUidata['section_details']
                                    [3]['section_status'] ==
                                0
                            ? Container()
                            : ClaimModules(),
                      ],
                    ),
                  ),
                ),
              ),
              CommonBottomBar(changetabcolor: changetabcolor)
            ],
          );
        },
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
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 2.2.h),
                height: 15.h,
                width: 100.h,
                child: ListView.builder(
                  itemCount: HomeController
                      .GetAllHomeScrenUidata['employee_benefit_support']['data']
                      .length,
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
                            Get.to(NetworkHospital(),
                                transition: transitoineffect);
                          }
                          if (index == 3) {
                            Get.to(IntimateClaim(),
                                transition: transitoineffect);
                          }
                          if (index == 4) {
                            Get.to(DownloadForms(),
                                transition: transitoineffect);
                          }
                          if (index == 5) {
                            Get.to(MembersCoverd(),
                                transition: transitoineffect);
                          }
                          if (index == 6) {
                            Get.to(MyclaimStatus(),
                                transition: transitoineffect);
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
                                  boxShadow: commonboxshadowBlue),
                              child: SvgPicture.network(
                                '${HomeController.GetAllHomeScrenUidata['employee_benefit_support']['data'][index]['icon']}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 19.w,
                              child: Text(
                                '${HomeController.GetAllHomeScrenUidata['employee_benefit_support']['data'][index]['label']}',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                top: 4.3.h,
                child: InkWell(
                  onTap: () {
                    runscroll();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.black12,
                              spreadRadius: 2)
                        ]),
                    padding: EdgeInsets.all(1.h),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 1.5.h,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Row(
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
                          SvgPicture.network(HomeController
                                  .GetAllHomeScrenUidata['personal_insurance']
                              ['data'][0]['icon']),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['personal_insurance']['data'][0]['label']}',
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
                        Get.to(HealthInsurerGroupsMainScreenFirst());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 4.h),
                        decoration: BoxDecoration(
                            color: pWhite,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.network(HomeController
                                    .GetAllHomeScrenUidata['personal_insurance']
                                ['data'][1]['icon']),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              '${HomeController.GetAllHomeScrenUidata['personal_insurance']['data'][1]['label']}',
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
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                      decoration: BoxDecoration(
                          color: pWhite,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.network(HomeController
                                  .GetAllHomeScrenUidata['personal_insurance']
                              ['data'][2]['icon']),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['personal_insurance']['data'][2]['label']}',
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
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.network(HomeController
                                  .GetAllHomeScrenUidata['personal_insurance']
                              ['data'][3]['icon']),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['personal_insurance']['data'][3]['label']}',
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
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(3.h),
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
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  ValidateNow() {
    return GestureDetector(
      onTap: () {
        Get.to(CompleteEnroll());
      },
      child: Container(
        decoration: BoxDecoration(),
        margin: EdgeInsets.only(bottom: 2.h),
        width: 100.h,
        child: SvgPicture.network(HomeController
            .GetAllHomeScrenUidata['enrollment']['data'][0]['icon']),
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
        itemCount:
            HomeController.GetAllHomeScrenUidata['banner']['data'].length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                '${HomeController.GetAllHomeScrenUidata['banner']['data'][index]['icon']}',
                fit: BoxFit.contain,
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
                            child: SvgPicture.network(
                                height: 4.h,
                                '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][0]['icon']}'),
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][0]['label']}',
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
                            child: SvgPicture.network(
                                height: 4.h,
                                '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][1]['icon']}'),
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][1]['label']}',
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
                            child: SvgPicture.network(
                                height: 4.h,
                                '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][2]['icon']}'),
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][2]['label']}',
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
                            child: SvgPicture.network(
                                height: 4.h,
                                '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][3]['icon']}'),
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][3]['label']}',
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
                      url: 'https://app.medibhai.com/doctors',
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
                            child: SvgPicture.network(
                                height: 4.h,
                                '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][4]['icon']}'),
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][4]['label']}',
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
                        url: 'https://app.medibhai.com/search-hospital',
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
                            child: SvgPicture.network(
                                height: 4.h,
                                '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][5]['icon']}'),
                          ),
                          Text(
                            '${HomeController.GetAllHomeScrenUidata['wellness_corner']['data'][5]['label']}',
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
