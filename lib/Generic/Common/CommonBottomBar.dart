// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/HealthInsureController.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:odin/Generic/Constant/colors.dart';
import 'package:odin/Screens/HomePage.dart';
import 'package:odin/Screens/My_Profile/MyProfile.dart';
import 'package:odin/Screens/Support.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonBottomBar extends StatefulWidget {
  final changetabcolor;

  CommonBottomBar({super.key, required this.changetabcolor});

  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  final HealthController = Get.put(HealthInsuranceSupportController());

  @override
  void initState() {
    HealthController.PolicyListingFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.8.h,
      width: 100.h,
      margin: Platform.isIOS
          ? EdgeInsets.only(bottom: 2.5.h)
          : EdgeInsets.only(
              top: 0,
            ),
      decoration: BoxDecoration(
          color: pWhite,
          border:
              Border(top: BorderSide(color: Color(0xffe4e4e4), width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                Get.to(() => HomePage(), transition: Transition.noTransition);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/Images/Home.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  color: widget.changetabcolor == 'Home'
                      ? Color(0xff338EC0)
                      : Colors.grey.shade400,
                ),
                Text(
                  'Home',
                  style: widget.changetabcolor == 'Home'
                      ? labelTextStyleDarkBlueReguler14
                      : labelTextStyleBlackReguler14,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                HealthController.PolicyListingFunction();
                Get.to(Support(), transition: Transition.noTransition);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/Images/Teleconsult.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  color: widget.changetabcolor == 'Support'
                      ? Color(0xff338EC0)
                      : Colors.grey.shade400,
                ),
                Text(
                  'Support',
                  style: widget.changetabcolor == 'Support'
                      ? labelTextStyleDarkBlueReguler14
                      : labelTextStyleBlackReguler14,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                url();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/Images/Whatsapp.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  color: widget.changetabcolor == 'whatsapp'
                      ? Color(0xff338EC0)
                      : Colors.grey.shade400,
                ),
                Text(
                  'Whatsapp',
                  style: widget.changetabcolor == 'whatsapp'
                      ? labelTextStyleDarkBlueReguler14
                      : labelTextStyleBlackReguler14,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                Get.to(() => MyProfileScreen(),
                    transition: Transition.noTransition);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/Images/Profile.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  color: widget.changetabcolor == 'Profile'
                      ? Color(0xff338EC0)
                      : Colors.grey.shade400,
                ),
                Text(
                  'Profile',
                  style: widget.changetabcolor == 'Profile'
                      ? labelTextStyleDarkBlueReguler14
                      : labelTextStyleBlackReguler14,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void url() {
    String phone = '+918779534228';
    String message = 'Hi';
    if (Platform.isAndroid) {
      launch("https://wa.me/$phone/?text=${Uri.parse(message)}"); // new line
    } else if (Platform.isIOS) {
      launch("https://wa.me/$phone/?text=${Uri.parse(message)}"); // new line
    }
  }
}
