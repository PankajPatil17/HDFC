// ignore_for_file: unused_field, invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/SignUpController.dart';
import 'package:odin/Generic/Constant/colors.dart';
import 'package:odin/Screens/HomePage.dart';
import 'package:odin/Screens/SignUp/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var SignUpcontroller = Get.put(SignUpController());
  void initState() {
    SignUpcontroller.gettokenfunction();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(SignUpcontroller.currentUserToken == null
          ? LoginScreen()
          : HomePage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Images/Odin_Logo.svg'),
          ],
        ),
      ),
    );
  }
}
