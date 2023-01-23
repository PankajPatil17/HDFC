import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Screens/Personal_Insurance/Health_Insurance/PermanantAddressForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProposersDetailsForm extends StatefulWidget {
  const ProposersDetailsForm({super.key});

  @override
  State<ProposersDetailsForm> createState() => _ProposersDetailsFormState();
}

class _ProposersDetailsFormState extends State<ProposersDetailsForm> {
  var changetabcolor;
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());
  final formKey = GlobalKey<FormState>();
  TextEditingController Fname = TextEditingController();
  TextEditingController Mname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController Adharnum = TextEditingController();
  TextEditingController PanNum = TextEditingController();
  TextEditingController AdditonalContactdetails = TextEditingController();
  String? Title;
  String? Gender;
  String? Marital;
  String? Occupation;
  String? GstRadioBtn;
  DateTime? _selectedDate;
  List TitleList = ['Mr', 'Mrs', 'Miss'];
  List maritalList = ['Married', 'Unmarried', 'Divorcee', 'Widow', 'Widower'];
  List occupationList = ['Salaried', 'Professional', 'Student'];
  List genderList = [
    'Male',
    'Female',
    'Other',
  ];
  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
                          label: 'Proposer\'s Details',
                          colorT: Color(0xff021B8D),
                          fontw8: FontWeight.w600,
                          size: 13.sp,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Title'),
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
                                        "Select Title",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            fontFamily: 'Nunito Sans'),
                                      ),
                                      value: Title,
                                      items: TitleList.map((item) {
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
                                          Title = value.toString();
                                        });
                                      },
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'First Name'),
                                Container(
                                  decoration: BoxDeco(),
                                  width: 43.w,
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please Enter Your First Name';
                                      } else if (val.length < 2) {
                                        return "Please enter First Name";
                                      }
                                      return null;
                                    },
                                    controller: Fname,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      hintText: 'Enter First Name',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Middle Name'),
                                Container(
                                  decoration: BoxDeco(),
                                  width: 43.w,
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please Enter Middle Name';
                                      } else if (val.length < 2) {
                                        return "Please Enter Middle Name";
                                      }
                                      return null;
                                    },
                                    controller: Mname,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      hintText: 'Enter Middle Name',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp,
                                          fontFamily: 'Nunito Sans'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Last Name'),
                                Container(
                                  decoration: BoxDeco(),
                                  width: 43.w,
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please Enter Last Name';
                                      } else if (val.length < 2) {
                                        return "Please Enter Last Name";
                                      }
                                      return null;
                                    },
                                    controller: Lname,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      hintText: 'Enter Last Name',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Gender'),
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
                                        "Select Gender",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            fontFamily: 'Nunito Sans'),
                                      ),
                                      value: Gender,
                                      items: genderList.map((item) {
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
                                          Gender = value.toString();
                                        });
                                      },
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Marital Status'),
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
                                        "Select Marital Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            fontFamily: 'Nunito Sans'),
                                      ),
                                      value: Marital,
                                      items: maritalList.map((item) {
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
                                          Marital = value.toString();
                                        });
                                      },
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Date of Birth'),
                                Container(
                                    height: 6.5.h,
                                    width: 43.w,
                                    decoration: BoxDeco(),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.5.h, horizontal: 1.3.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _selectedDate != null
                                              ? _selectedDate
                                                  .toString()
                                                  .replaceRange(11, 23, '')
                                              : 'Select Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              fontFamily: 'Nunito Sans'),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _presentDatePicker();
                                            });
                                          },
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: Color(0xffb2b2b2),
                                            size: 2.3.h,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderText(titleLabel: 'Occupation'),
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
                                        "Select Occupation",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            fontFamily: 'Nunito Sans'),
                                      ),
                                      value: Occupation,
                                      items: occupationList.map((item) {
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
                                          Occupation = value.toString();
                                        });
                                      },
                                    )),
                              ],
                            ),
                          ],
                        ),
                        HeaderText(titleLabel: 'Email'),
                        Container(
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
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Mobile Number'),
                        Container(
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
                            controller: mobile,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter your Mobile Number',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Additional Contact Details'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            maxLength: 10,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'The Contact Number field is required';
                              } else if (v.length != 10) {
                                return 'The Contact Number field is not in the correct format';
                              }
                              return null;
                            },
                            controller: AdditonalContactdetails,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Additional Contact Details',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Pancard Number'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Pancard Number';
                              } else if (val.length < 2) {
                                return "Please Enter Pancard Number";
                              }
                              return null;
                            },
                            controller: PanNum,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Pancard Number',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Addhar Number'),
                        Container(
                          decoration: BoxDeco(),
                          width: 100.w,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Addhar Number';
                              } else if (val.length < 2) {
                                return "Please Enter Addhar Number";
                              }
                              return null;
                            },
                            controller: Adharnum,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              hintText: 'Enter Addhar Number',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  fontFamily: 'Nunito Sans'),
                            ),
                          ),
                        ),
                        HeaderText(titleLabel: 'Do you have GST Number?'),
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
                                groupValue: GstRadioBtn,
                                onChanged: (value) {
                                  setState(() {
                                    GstRadioBtn = value.toString();
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
                                groupValue: GstRadioBtn,
                                onChanged: (value) {
                                  setState(() {
                                    GstRadioBtn = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                                Get.to(PermanantAddressForm());
                              }
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
                                      Color(0xff49D49D),
                                      Color(0xff49D49D),
                                    ])),
                                child: CommonTextNunito(
                                  label: 'Next',
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
