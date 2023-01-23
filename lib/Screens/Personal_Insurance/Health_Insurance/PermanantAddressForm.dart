import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PermanantAddressForm extends StatefulWidget {
  const PermanantAddressForm({super.key});

  @override
  State<PermanantAddressForm> createState() => _PermanantAddressFormState();
}

class _PermanantAddressFormState extends State<PermanantAddressForm> {
  var changetabcolor;
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  final formKey = GlobalKey<FormState>();
  TextEditingController AddLine1 = TextEditingController();
  TextEditingController AddLine2 = TextEditingController();
  TextEditingController AddLine3 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController Pin = TextEditingController();
  String? State;
  String? PermenantRadioBtn;

  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: SafeArea(
                child: Container(
              height: 7.h,
              width: 100.h,
              padding: EdgeInsets.only(right: 1.2.h),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
              ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Image.asset(
                      'assets/Images/Hdfc_Logo.png',
                      height: 4.h,
                      width: 4.h,
                    ),
                  ),
                ],
              ),
            )),
            preferredSize: Size(100.h, 7.h)),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextNunito(
                          label: 'Permanent Address',
                          colorT: Color(0xff021B8D),
                          fontw8: FontWeight.w600,
                          size: 13.sp,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HeaderText(titleLabel: 'Address Line 1'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Address Line 1';
                              } else if (val.length < 2) {
                                return "Please Enter Address Line 1";
                              }
                              return null;
                            },
                            controller: AddLine1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Address Line 1',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Address Line 2'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Address Line 2';
                              } else if (val.length < 2) {
                                return "Please Enter Address Line 2";
                              }
                              return null;
                            },
                            controller: AddLine2,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Address Line 2',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Address Line 3'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Address Line 3';
                              } else if (val.length < 2) {
                                return "Please Enter Address Line 3";
                              }
                              return null;
                            },
                            controller: AddLine3,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Address Line 3',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'State'),
                                Container(
                                    height: 6.5.h,
                                    width: 43.w,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.5.h, horizontal: 1.h),
                                    decoration: BoxDeco(),
                                    child: DropdownButton(
                                      underline: Container(
                                        color: Colors.white,
                                      ),
                                      focusColor: Colors.white,
                                      menuMaxHeight: 300.0,
                                      isExpanded: true,
                                      isDense: true,
                                      hint: Text(
                                        "Select State",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            fontFamily: 'Nunito Sans'),
                                      ),
                                      value: State,
                                      items: HealthInauranceController
                                          .AllStateList.map((item) {
                                        return DropdownMenuItem(
                                            enabled: true,
                                            value: item.toString(),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ));
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          State = value.toString();
                                        });
                                      },
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'City'),
                                Container(
                                  decoration: BoxDeco(),
                                  width: 43.w,
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please Enter Your City';
                                      } else if (val.length < 2) {
                                        return "Please enter City";
                                      }
                                      return null;
                                    },
                                    controller: city,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      hintText: 'Enter City',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp,
                                          fontFamily: 'Nunito Sans'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        HeaderText(titleLabel: 'Pincode'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            maxLength: 6,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'The Pincode Number field is required';
                              } else if (v.length != 6) {
                                return 'The Pincode Number field is not in the correct format';
                              }
                              return null;
                            },
                            controller: Pin,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Pincode',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: CommonTextNunito(
                            label: 'Communication Address',
                            colorT: Color(0xff021B8D),
                            fontw8: FontWeight.w600,
                            size: 13.sp,
                          ),
                        ),
                        HeaderText(titleLabel: 'Same as Permanent Address'),
                        Row(
                          children: [
                            Container(
                              width: 22.w,
                              child: RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text("No",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                        fontFamily: 'Nunito Sans')),
                                value: "No",
                                groupValue: PermenantRadioBtn,
                                onChanged: (value) {
                                  setState(() {
                                    PermenantRadioBtn = value.toString();
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 19.h,
                              child: RadioListTile(
                                contentPadding:
                                    EdgeInsets.only(right: 0, left: 10.w),
                                title: Text("Yes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                        fontFamily: 'Nunito Sans')),
                                value: "yes",
                                groupValue: PermenantRadioBtn,
                                onChanged: (value) {
                                  setState(() {
                                    PermenantRadioBtn = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (formKey.currentState!.validate()) {}
                            });
                          },
                          child: Center(
                            child: Container(
                                margin:
                                    EdgeInsets.only(top: 3.h, bottom: 2.5.h),
                                height: 6.h,
                                width: 15.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff4BC4F9),
                                      Color(0xff4BC4F9),
                                    ])),
                                child: CommonTextNunito(
                                  label: 'Submit',
                                  colorT: Colors.white,
                                  fontw8: FontWeight.w500,
                                  size: 12.sp,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CommonBottomBar(changetabcolor: changetabcolor)
          ],
        )));
  }

  //header Text
  HeaderText({titleLabel}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, top: 2.2.h),
      child: CommonTextNunito(
        label: titleLabel,
        colorT: Color(0xff313131),
        fontw8: FontWeight.w600,
        size: 12.sp,
      ),
    );
  }

  //commonDecoration
  BoxDeco() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: commonboxshadowBlue);
  }
}
