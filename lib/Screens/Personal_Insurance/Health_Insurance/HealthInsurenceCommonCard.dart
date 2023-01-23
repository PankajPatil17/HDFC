import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/ProposersDetailsForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HealthInsurenceCommonCard extends StatefulWidget {
  const HealthInsurenceCommonCard({super.key});

  @override
  State<HealthInsurenceCommonCard> createState() =>
      _HealthInsurenceCommonCardState();
}

class _HealthInsurenceCommonCardState extends State<HealthInsurenceCommonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(bottom: 2.3.h),
      decoration: BoxDecoration(
          color: pWhite,
          boxShadow: commonboxshadowBlue,
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.5.h, left: 1.5.h, right: 1.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://www.nivabupa.com/content/dam/nivabupa/Image/logos/NivaLogo324x180.png',
                  height: 7.h,
                  width: 7.h,
                ),
                SizedBox(
                  width: 68.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextNunito(
                            label: 'NivaBupa',
                            colorT: Color(0xff021B8D),
                            fontw8: FontWeight.w600,
                            size: 11.sp,
                            maxline: 1,
                          ),
                          Container(
                            padding: EdgeInsets.all(0.4.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: commonboxshadowBlue,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.compare_arrows_rounded,
                              size: 2.5.h,
                              color: Color(0xff021B8D),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      CommonTextNunito(
                        label: 'NivaBupa Health Insurance',
                        colorT: Colors.black,
                        fontw8: FontWeight.w500,
                        size: 9.sp,
                        maxline: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.h),
            child: Divider(
              color: Color(0xff4BC4F9),
              thickness: 0.8,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.5.h),
            child: Row(
              children: [
                CommonTextNunito(
                  label: 'Sum Insured :',
                  colorT: Colors.black,
                  fontw8: FontWeight.w500,
                  size: 10.sp,
                  maxline: 1,
                ),
                CommonTextNunito(
                  label: ' 20,00,000',
                  colorT: Color(0xff021B8D),
                  fontw8: FontWeight.w700,
                  size: 11.sp,
                  maxline: 1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.h),
            child: Row(
              children: [
                Icon(
                  Icons.file_download,
                  size: 2.5.h,
                  color: Color(0xff021B8D),
                ),
                CommonTextNunito(
                  label: '  Download Brochure',
                  colorT: Color(0xff021B8D),
                  fontw8: FontWeight.w600,
                  size: 10.sp,
                  maxline: 1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextNunito(
                      label: '13,097.00',
                      colorT: Colors.black,
                      fontw8: FontWeight.w700,
                      size: 12.sp,
                      maxline: 1,
                    ),
                    CommonTextNunito(
                      label: '(Inclusive of GST)',
                      colorT: Colors.black,
                      fontw8: FontWeight.w500,
                      size: 8.sp,
                      maxline: 1,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ProposersDetailsForm());
                  },
                  child: Container(
                    padding: EdgeInsets.all(1.5.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff4BC4F9),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: CommonTextNunito(
                        label: '  Select Plan  ',
                        colorT: Colors.black,
                        fontw8: FontWeight.w600,
                        size: 10.sp,
                        maxline: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(1.4.h),
              margin: EdgeInsets.only(top: 2.h),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/Images/img.png'))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    label: 'View all plans',
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: Color(0xff021B8D),
                        fontFamily: 'Nunito Sans'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
