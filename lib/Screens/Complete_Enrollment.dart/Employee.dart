import 'package:flutter/material.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:sizer/sizer.dart';

class EmployeedetailsScreen extends StatefulWidget {
  const EmployeedetailsScreen({super.key});

  @override
  State<EmployeedetailsScreen> createState() => _EmployeedetailsScreenState();
}

class _EmployeedetailsScreenState extends State<EmployeedetailsScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController EMPNum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(titleLabel: 'Employee Name'),
        Container(
          decoration: BoxDeco(),
          width: 100.w,
          margin: EdgeInsets.symmetric(horizontal: 0.2.h),
          child: TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter Your Name';
              } else if (val.length < 2) {
                return "Please enter Name";
              }
              return null;
            },
            controller: name,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              hintText: 'Enter Name',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  fontFamily: 'Nunito'),
            ),
          ),
        ),
        HeaderText(titleLabel: 'Email'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.2.h),
          decoration: BoxDeco(),
          width: 100.w,
          child: TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter your Email';
              } else if (val.length < 2) {
                return "Please Enter your Email";
              }
              return null;
            },
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  fontFamily: 'Nunito'),
            ),
          ),
        ),
        HeaderText(titleLabel: 'Employee Number'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.2.h),
          decoration: BoxDeco(),
          width: 100.w,
          child: TextFormField(
            maxLength: 20,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'The Employee Number field is required';
              } else if (v.length != 20) {
                return 'The Employee Number field is not in the correct format';
              }
              return null;
            },
            controller: EMPNum,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              hintText: 'Enter Employee Number',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  fontFamily: 'Nunito'),
            ),
          ),
        ),
        HeaderText(titleLabel: 'Mobile Number'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.2.h),
          decoration: BoxDeco(),
          width: 100.w,
          child: TextFormField(
            maxLength: 10,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'The Mobile Number field is required';
              } else if (v.length != 10) {
                return 'The Mobile Number field is not in the correct format';
              }
              return null;
            },
            controller: EMPNum,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              hintText: 'Enter Mobile Number',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  fontFamily: 'Nunito'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            margin: EdgeInsets.symmetric(vertical: 3.h),
            width: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xffD82A1B),
              ),
            ),
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: Colors.black,
                    fontFamily: 'Inter'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //header Text
  HeaderText({titleLabel}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, top: 2.2.h),
      child: CommonTextNunito(
        label: titleLabel,
        colorT: Color(0xff313131),
        fontw8: FontWeight.w500,
        size: 12.sp,
      ),
    );
  }

  //commonDecoration
  BoxDeco() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 2),
              color: Colors.red.shade100)
        ]);
  }
}
