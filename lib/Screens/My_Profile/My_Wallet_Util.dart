// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/AccountController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MyWalletUtil extends StatefulWidget {
  final labelname;

  const MyWalletUtil({super.key, this.labelname});

  @override
  State<MyWalletUtil> createState() => _MyWalletUtilState();
}

class _MyWalletUtilState extends State<MyWalletUtil> {
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
              fontFamily: 'Inter'),
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
                child: SingleChildScrollView(
                  child: AccountController.WalletTransation.length == 0 ||
                          AccountController.WalletTransation.length == null ||
                          AccountController.WalletTransation == []
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 25.h,
                                  child: Image.asset(
                                      'assets/Images/No_Wallet.gif')),
                              CommonText(
                                label: 'No Wallet Utilization Found',
                                textStyle: labelTextStyleBlackReguler19,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        )
                      : Column(
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
                                        fontFamily: 'Inter')),
                                CommonText(
                                    label:
                                        '${AccountController.PendingwalletPoints}',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontFamily: 'Inter')),
                                CommonText(
                                    label: ' Points',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontFamily: 'Inter')),
                              ],
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemCount:
                                  AccountController.WalletTransation.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(1.h),
                                  padding: EdgeInsets.all(1.2.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
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
                                      Container(
                                        height: 5.h,
                                        width: 100.h,
                                        color: Colors.cyan.shade300,
                                        padding: EdgeInsets.only(left: 1.2.h),
                                        child: Row(
                                          children: [
                                            CommonText(
                                                label: 'Category : ',
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter')),
                                            CommonText(
                                                label: AccountController.WalletTransation[index]
                                                            ['module_id'] ==
                                                        1
                                                    ? 'DIAGNOSTICS'
                                                        .capitalizeFirst
                                                    : AccountController.WalletTransation[index]
                                                                ['module_id'] ==
                                                            2
                                                        ? 'DOCTOR'
                                                            .capitalizeFirst
                                                        : AccountController.WalletTransation[index]
                                                                    [
                                                                    'module_id'] ==
                                                                3
                                                            ? 'TELECONSULTATION'
                                                                .capitalizeFirst
                                                            : AccountController.WalletTransation[index]['module_id'] ==
                                                                    4
                                                                ? 'NUTRITION'
                                                                    .capitalizeFirst
                                                                : AccountController.WalletTransation[index]['module_id'] ==
                                                                        5
                                                                    ? 'MEDICINE'
                                                                        .capitalizeFirst
                                                                    : 'DENTAL'
                                                                        .capitalizeFirst,
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter')),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 100.h,
                                        color: Colors.cyan.shade300,
                                        padding: EdgeInsets.only(left: 1.2.h),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        child: Row(
                                          children: [
                                            CommonText(
                                                label: 'Points Used : ',
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter')),
                                            CommonText(
                                                label: AccountController
                                                    .WalletTransation[index]
                                                        ['points']
                                                    .toString(),
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter')),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 100.h,
                                        color: Colors.cyan.shade300,
                                        padding: EdgeInsets.only(left: 1.2.h),
                                        child: Row(
                                          children: [
                                            CommonText(
                                                label: 'Date of transaction : ',
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter')),
                                            CommonText(
                                                label: AccountController
                                                    .WalletTransation[index]
                                                        ['crdt_dt']
                                                    .toString(),
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Inter')),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      HtmlWidget(
                                        '''
                   ${AccountController.WalletTransation[index]['remarks']}
                  ''',
                                        customStylesBuilder: (element) {
                                          if (element.classes.contains('foo')) {
                                            return {'color': 'red'};
                                          }
                                          return null;
                                        },
                                        enableCaching: true,
                                        onErrorBuilder:
                                            (context, element, error) =>
                                                Text('$element error: $error'),
                                        onLoadingBuilder: (context, element,
                                                loadingProgress) =>
                                            CircularProgressIndicator(),
                                        renderMode: RenderMode.column,
                                        textStyle: labelTextStyleBlackReguler16,
                                      ),
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
