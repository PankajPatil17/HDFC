import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/HomePage.dart';
import 'package:hdfc_bank/main.dart';
import 'package:sizer/sizer.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  List RelationShipList = ['Select Relationship', 'Son', 'Daughter'];

  List GenderList = [
    'Select Gender',
    'Male',
    'Female',
  ];

  MemberHeaderText(memberLabel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.6.h),
      child: Text(
        memberLabel,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12.sp, fontFamily: 'Nunito'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please verify below details',
            style: TextStyle(
                color: Color(0xffb2b2b2),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
