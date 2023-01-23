import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';

class CorporateEmployeeSignUp extends StatefulWidget {
  const CorporateEmployeeSignUp({super.key});

  @override
  State<CorporateEmployeeSignUp> createState() =>
      _CorporateEmployeeSignUpState();
}

class _CorporateEmployeeSignUpState extends State<CorporateEmployeeSignUp> {
  var SignUpcontroller = Get.put(SignUpController());
  TextEditingController empIdController = TextEditingController();
  TextEditingController CorpCodeController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: 100.h,
        width: 100.h,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SvgPicture.asset('assets/Images/bg1.svg')]),
              SizedBox(
                height: 5.h,
              ),
              CommonText(
                label: 'Corporate Employee Registration',
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Inter'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4.h),
                child: TextFormField(
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'The Employee ID is required';
                    }
                    return null;
                  },
                  controller: empIdController,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: 'Enter Employee ID',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black26,
                          fontFamily: 'Inter'),
                      contentPadding: EdgeInsets.all(2.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 4.h),
                child: TextFormField(
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'The Corporate Code is required';
                    }
                    return null;
                  },
                  controller: CorpCodeController,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: 'Enter Corporate Code',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black26,
                          fontFamily: 'Inter'),
                      contentPadding: EdgeInsets.all(2.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(6)),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Get.back();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      margin: EdgeInsets.only(bottom: 2.5.h),
                      width: 14.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.cyan),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'BACK',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.cyan,
                              letterSpacing: 1,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          SignUpcontroller.CorporateEmpReg(
                              empId: empIdController.text,
                              corporatecode: CorpCodeController.text);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      margin: EdgeInsets.only(bottom: 2.5.h),
                      width: 14.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.cyan),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.cyan,
                              letterSpacing: 1,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/Images/bg2.svg'),
                ],
              )
            ]),
          ),
        ),
      )),
    );
  }
}
