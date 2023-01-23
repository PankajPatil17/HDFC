import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hdfc_bank/Controller/AccountController.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Screens/HealthInsureSupport/HealthInsureSupportMainScreen.dart';
import 'package:hdfc_bank/Screens/My_Profile/MyProfile.dart';
import 'package:hdfc_bank/Screens/OnBoarding/WebViewScreen.dart';
import 'package:hdfc_bank/Screens/SignUp/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:store_redirect/store_redirect.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var AccountController = Get.put(MyAccountProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 33.5.h,
        padding: EdgeInsets.all(1.2.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(6), bottomRight: Radius.circular(6))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close_outlined,
                    color: mainBlue,
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 6.0.h,
                  width: 6.0.h,
                  margin: EdgeInsets.only(right: 1.h),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xffe4e4e4)),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'))),
                ),
                FutureBuilder(
                  future: AccountController.UserDetailsFunction(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Expanded(
                      child: Text(
                        '${AccountController.profileFullName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            color: Color(0xff333333)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(MyProfileScreen());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/Images/Profile.svg',
                  color: mainBlue,
                ),
                SizedBox(
                  width: 1.5.h,
                ),
                CommonText(
                  label: 'Profile',
                  textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.5.h),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  HealthInsureSupportMainScreen(),
                  transition: transitoineffect,
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Images/Health Insurance Support.svg',
                    color: mainBlue,
                  ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  CommonText(
                    label: 'Health Insurance Support',
                    textStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/Images/Wellness Support.svg',
                  color: mainBlue,
                ),
                SizedBox(
                  width: 1.5.h,
                ),
                CommonText(
                  label: 'Wellness Support',
                  textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.5.h),
            child: GestureDetector(
              onTap: () {
                Get.to(WebviewScreen(
                    url: 'https://odinassure.com/odin-terms-and-conditions',
                    labelname: 'Terms & Condition'));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Images/Terms and Conditions.svg',
                    color: mainBlue,
                  ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  CommonText(
                    label: 'Terms and Conditions',
                    textStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(WebviewScreen(
                labelname: 'Privacy Policy',
                url: 'https://odinassure.com/odin-privacy-policy',
              ));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/Images/Privacy Policy.svg',
                  color: mainBlue,
                ),
                SizedBox(
                  width: 1.5.h,
                ),
                CommonText(
                  label: 'Privacy Policy',
                  textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 3.5.h),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SvgPicture.asset(
          //         'assets/Images/FAQ.svg',
          //         color: mainBlue,
          //       ),
          //       SizedBox(
          //         width: 1.5.h,
          //       ),
          //       CommonText(
          //         label: 'FAQ',
          //         textStyle: TextStyle(
          //             fontFamily: 'Inter',
          //             fontSize: 12.sp,
          //             fontWeight: FontWeight.w400),
          //       )
          //     ],
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              setState(() {
                StoreRedirect.redirect(
                    androidAppId: 'com.medibhai', iOSAppId: '1639780511');
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/Images/Rate_Us.svg',
                  color: mainBlue,
                ),
                SizedBox(
                  width: 1.5.h,
                ),
                CommonText(
                  label: 'Rate Us',
                  textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              setState(() {
                Get.offAll(LoginScreen(), transition: transitoineffect);
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Images/Logout.svg',
                    color: mainBlue,
                  ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  CommonText(
                    label: 'Logout',
                    textStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // final _RatingDilog = RatingDialog(
  //     title: Text('Please Rate This App'),
  //     submitButtonText: 'Submit',
  //     onSubmitted: (response) {
  //       StoreRedirect.redirect(
  //           androidAppId: 'com.medibhai',
  //           iOSAppId: 'com.example.medibhaiproject');
  //     });
}
