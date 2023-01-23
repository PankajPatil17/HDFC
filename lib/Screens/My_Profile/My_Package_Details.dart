// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/AccountController.dart';
import 'package:odin/Generic/Common/CommonBottomBar.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:odin/Screens/My_Profile/Activate_Your_Package.dart';
import 'package:sizer/sizer.dart';

class MyPackageDetails extends StatefulWidget {
  final labelname;

  const MyPackageDetails({super.key, this.labelname});

  @override
  State<MyPackageDetails> createState() => _MyPackageDetailsState();
}

class _MyPackageDetailsState extends State<MyPackageDetails> {
  var AccountController = Get.put(MyAccountProfileController());
  var changetabcolor;
  void initState() {
    changetabcolor = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        title: CommonText(
          label: widget.labelname,
          textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Poppins'),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 100.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.5.h),
                child: AccountController.MyPkgDetails.length == 0 ||
                        AccountController.MyPkgDetails.length == null ||
                        AccountController.MyPkgDetails == []
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 25.h,
                                child: Image.asset(
                                    'assets/Images/No_Package.gif')),
                            CommonText(
                              label: 'No Active Packages Found',
                              textStyle: labelTextStyleBlackReguler19,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ActivewellnesPackage();
                                      },
                                    );
                                  });
                                },
                                child: CommonText(
                                  label: 'Activate Now',
                                  textStyle: TextStyle(
                                      color: Color(0xff2479ab),
                                      fontFamily: 'Poppins',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CommonText(
                                    label: 'Your Pending Wallet Points is : ',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontFamily: 'Poppins')),
                                CommonText(
                                    label:
                                        '${AccountController.PendingwalletPoints}',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontFamily: 'Poppins')),
                                CommonText(
                                    label: ' Points',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontFamily: 'Poppins')),
                              ],
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemCount: AccountController.MyPkgDetails.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(1.h),
                                  padding: EdgeInsets.all(1.2.h),
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade700,
                                      border: Border.all(
                                        color: Color(0xffe4e4e4),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 8,
                                            spreadRadius: 0.2)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CommonText(
                                              label: 'Package : ',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                          CommonText(
                                              label: AccountController
                                                  .MyPkgDetails[index]
                                                      ['package_name']
                                                  .toString(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      ),
                                      Divider(
                                          color: Colors.white, thickness: 1),
                                      Row(
                                        children: [
                                          CommonText(
                                              label: 'Package Partner : ',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                          CommonText(
                                              label: AccountController
                                                  .MyPkgDetails[index]
                                                      ['corporate_name']
                                                  .toString(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CommonText(
                                              label: 'Order Date : ',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                          CommonText(
                                              label: AccountController
                                                  .MyPkgDetails[index]
                                                      ['created_at']
                                                  .toString(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CommonText(
                                              label: 'Expiry Date : ',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                          CommonText(
                                              label: AccountController
                                                  .MyPkgDetails[index]
                                                      ['expiring_on']
                                                  .toString(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      ),
                                      CommonText(
                                          label:
                                              'Wallet Amount : ${AccountController.MyPkgDetails[index]['package_wallet_amount']}',
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontFamily: 'Poppins')),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
          CommonBottomBar(changetabcolor: changetabcolor)
        ],
      )),
    );
  }
}
