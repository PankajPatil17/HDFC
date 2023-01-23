import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/AccountController.dart';
import 'package:hdfc_bank/Controller/HomePageController.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Custom/Custom_Drawer.dart';
import 'package:hdfc_bank/Screens/My_Profile/My_Package_Details.dart';
import 'package:hdfc_bank/Screens/My_Profile/My_Wallet_Util.dart';
import 'package:hdfc_bank/Screens/NotificationScreen.dart';
import 'package:hdfc_bank/Screens/OnBoarding/WebViewScreen.dart';
import 'package:hdfc_bank/Screens/SignUp/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../Generic/Common/CommonBottomBar.dart';
import '../../Generic/Constant/variables.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var changetabcolor;

  @override
  void initState() {
    changetabcolor = 'Profile';
    super.initState();
  }

  var AccountController = Get.put(MyAccountProfileController());
  var HomeController = Get.put(HomePageController());

  List images = [
    'assets/Images/My_Package_Details.svg',
    'assets/Images/My_Wallet_Utilization.svg',
    // 'assets/Images/My_Order_Details.svg',
    // 'assets/Images/My_Health_Record.svg',
    'assets/Images/Terms and Conditions.svg',
    'assets/Images/Privacy Policy.svg',
    'assets/Images/Rate_Us.svg',
    'assets/Images/Logout.svg',
  ];

  List title = [
    'My Package Details',
    'My Wallet Utilization',
    // 'My Order Details',
    // 'My Health Record',
    'Terms and Conditions',
    'Privacy Policy',
    'Rate Us 5 stars',
    'Logout',
  ];

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
                              ? Colors.grey
                              : Color(0xff1ba8d3),
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
                                          color: Color(0xff2479ab),
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
          )),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            width: 100.w,
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: AccountController.UserDetailsFunction(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return AccountController.profileEmail == null
                      ? CustomLoader()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(1.5.h),
                              decoration:
                                  BoxDecoration(color: Color(0xffE2F5FF)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7.0.h,
                                    width: 7.0.h,
                                    margin: EdgeInsets.only(
                                        top: 2.5.h, bottom: 1.5.h, right: 2.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffe4e4e4)),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        label:
                                            '${AccountController.profileFullName}',
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            fontFamily: 'Inter'),
                                      ),
                                      CommonText(
                                        label:
                                            '${AccountController.profileEmail}',
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter'),
                                      ),
                                      CommonText(
                                        label:
                                            '${AccountController.profileMobile}',
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ListView.builder(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemCount: title.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (index == 5) {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.clear();
                                      Get.offAll(LoginScreen(),
                                          transition: transitoineffect);
                                    } else if (index == 4) {
                                      StoreRedirect.redirect(
                                          androidAppId: 'com.medibhai',
                                          iOSAppId: '1639780511');
                                    } else if (index == 3) {
                                      Get.to(WebviewScreen(
                                        labelname: 'Privacy Policy',
                                        url:
                                            'https://odinassure.com/odin-privacy-policy',
                                      ));
                                    } else if (index == 2) {
                                      Get.to(WebviewScreen(
                                        labelname: 'Terms & Condition',
                                        url:
                                            'https://odinassure.com/odin-terms-and-conditions',
                                      ));
                                    }
                                    //  else if (index == 2) {
                                    //   Get.to(MyHealthRecord(),
                                    //       transition: transitoineffect);
                                    // }
                                    else if (index == 1) {
                                      Get.to(
                                          MyWalletUtil(
                                            labelname: 'My Wallet Utilization',
                                          ),
                                          transition: transitoineffect);
                                    } else if (index == 0) {
                                      Get.to(
                                          MyPackageDetails(
                                            labelname: 'My Package Details',
                                          ),
                                          transition: transitoineffect);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(2.h),
                                    margin: EdgeInsets.only(
                                        bottom: 1.5.h,
                                        right: 1.5.h,
                                        left: 1.5.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: commonboxshadow,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          images[index],
                                          color: Colors.red.shade700,
                                        ),
                                        SizedBox(
                                          width: 1.5.h,
                                        ),
                                        CommonText(
                                          label: title[index],
                                          textStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                },
              ),
            ),
          )),
          CommonBottomBar(changetabcolor: changetabcolor)
        ],
      )),
    );
  }
}
