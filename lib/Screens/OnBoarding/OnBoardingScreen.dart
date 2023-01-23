import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Screens/HomePage.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool onLastpage = false;
  bool onFirstpage = false;
  final controller = PageController();

  @override
  void initState() {
    onFirstpage = true;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/Images/Odin_Logo.svg'),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 72.h,
                child: PageView(
                  controller: controller,
                  physics: ScrollPhysics(),
                  allowImplicitScrolling: true,
                  pageSnapping: true,
                  onPageChanged: (index) {
                    setState(() {
                      onLastpage = (index == 2);
                      onFirstpage = (index == 0);
                    });
                  },
                  children: [
                    FirstOnboarding(),
                    SecondOnboarding(),
                    ThirdOnboarding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// ONBOARDING CODE

  FirstOnboarding() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/Images/Ob1.png',
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 2.5.h, bottom: 2.2.h, left: 2.h, right: 2.h),
            child: Text(
              'Holistic health and wellness solutions',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: Color(0xff338EC0)),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                  spacing: 1.h,
                  dotHeight: 1.3.h,
                  dotWidth: 1.3.h,
                  dotColor: Color(0xffe4e4e4),
                  activeDotColor: Color(0xff2479ab)),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(microseconds: 500), curve: Curves.easeIn),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(HomePage());
                  },
                  child: CommonText(
                    label: 'Skip',
                    textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Color(0xff338EC0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    width: 9.h,
                    padding: EdgeInsets.only(top: 1.3.h, bottom: 1.3.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xff338EC0)),
                    child: Center(
                      child: CommonText(
                        label: 'Next',
                        textStyle: labelTextStyleWhiteReguler16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SecondOnboarding() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/Images/Ob2.png',
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 2.5.h, bottom: 2.2.h, left: 2.h, right: 2.h),
            child: Text(
              'Personalized and digital support for employee benefit programs',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: Color(0xff338EC0)),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                  spacing: 1.h,
                  dotHeight: 1.3.h,
                  dotWidth: 1.3.h,
                  dotColor: Color(0xffe4e4e4),
                  activeDotColor: Color(0xff2479ab)),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(microseconds: 500), curve: Curves.easeIn),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.previousPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: CommonText(
                    label: 'Back',
                    textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Color(0xff338EC0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    width: 9.h,
                    padding: EdgeInsets.only(top: 1.3.h, bottom: 1.3.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xff338EC0)),
                    child: Center(
                      child: CommonText(
                        label: 'Next',
                        textStyle: labelTextStyleWhiteReguler16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ThirdOnboarding() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/Images/Ob3.png',
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 2.5.h, bottom: 2.2.h, left: 2.h, right: 2.h),
            child: Text(
              'Complete claims support for health insurance policies',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: Color(0xff338EC0)),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                  spacing: 1.h,
                  dotHeight: 1.3.h,
                  dotWidth: 1.3.h,
                  dotColor: Color(0xffe4e4e4),
                  activeDotColor: Color(0xff2479ab)),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(microseconds: 500), curve: Curves.easeIn),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.previousPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: CommonText(
                    label: 'Back',
                    textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Color(0xff338EC0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(HomePage());
                  },
                  child: Container(
                    width: 12.h,
                    padding: EdgeInsets.only(top: 1.3.h, bottom: 1.3.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xff338EC0)),
                    child: Center(
                      child: CommonText(
                        label: 'Finish',
                        textStyle: labelTextStyleWhiteReguler16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
