import 'package:flutter/material.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
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

  final formKey = GlobalKey<FormState>();
  TextEditingController dependentNameone = TextEditingController();
  TextEditingController dependentNametwo = TextEditingController();
  TextEditingController spousedependentName = TextEditingController();
  TextEditingController sondependentName = TextEditingController();
  TextEditingController daughterdependentName = TextEditingController();

  String? genderone;
  String? gendertwo;
  String? spouseGender;
  String? sonGender;
  String? daughterGender;
  String? employeegender;
  String? childonerelation;
  String? childtworelation;
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
          Container(
            margin: EdgeInsets.only(bottom: 2.h, top: 2.h),
            padding: EdgeInsets.only(
              left: 1.5.h,
              right: 1.5.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: commonboxshadowBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 0.h),
                    iconColor: Color(0xff021B8D),
                    title: CommonText(
                      label: 'RelationShip: Employee',
                      textStyle: labelTextStyleBlackReguler16,
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Name')],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: 'Dependent Name',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Date of Birth')],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: _employeeselectedDate != null
                              ? _employeeselectedDate
                                  .toString()
                                  .replaceRange(11, 23, '')
                              : 'Date of Birth',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xffb2b2b2),
                              size: 2.3.h,
                            ),
                            onPressed: () {
                              setState(() {
                                _employeepresentDatePicker();
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Gender')],
                      ),
                      Container(
                        height: 5.5.h,
                        width: 100.h,
                        margin: EdgeInsets.only(bottom: 2.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Color(0xffb2b2b2), width: 1.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.h, right: 1.h, top: 0.9.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: CommonText(
                                label: 'Select Gender',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: employeegender,
                              items: GenderList.map((item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {},
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  employeegender = _v!;
                                });
                              }),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: commonboxshadowBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 0.h),
                    title: CommonText(
                      label: 'Relationship : Spouse',
                      textStyle: labelTextStyleBlackReguler16,
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Name')],
                      ),
                      TextFormField(
                        controller: spousedependentName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: 'Dependent Name',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Date of Birth')],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: _spouseselectedDate != null
                              ? _spouseselectedDate
                                  .toString()
                                  .replaceRange(11, 23, '')
                              : 'Date of Birth',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xffb2b2b2),
                              size: 2.3.h,
                            ),
                            onPressed: () {
                              setState(() {
                                _spousepresentDatePicker();
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Gender')],
                      ),
                      Container(
                        height: 5.5.h,
                        width: 100.h,
                        margin: EdgeInsets.only(bottom: 2.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Color(0xffb2b2b2), width: 1.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.h, right: 1.h, top: 0.9.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: CommonText(
                                label: 'Select Gender',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: spouseGender,
                              items: GenderList.map((item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {},
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  spouseGender = _v!;
                                });
                              }),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.h),
            padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: commonboxshadowBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 0.h),
                    title: CommonText(
                      label: 'Relationship : Child 1',
                      textStyle: labelTextStyleBlackReguler16,
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Select Relationship')],
                      ),
                      Container(
                        height: 5.5.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Color(0xffb2b2b2), width: 1.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.h, right: 1.h, top: 0.9.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: CommonText(
                                label: 'Select Relationship',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: childonerelation,
                              items: RelationShipList.map((item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {},
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  childonerelation = _v!;
                                });
                              }),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Name')],
                      ),
                      TextFormField(
                        controller: sondependentName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: 'Dependent Name',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Date of Birth')],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: _sonselectedDate != null
                              ? _sonselectedDate
                                  .toString()
                                  .replaceRange(11, 23, '')
                              : 'Date of Birth',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xffb2b2b2),
                              size: 2.3.h,
                            ),
                            onPressed: () {
                              setState(() {
                                _sonpresentDatePicker();
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Gender')],
                      ),
                      Container(
                        height: 5.5.h,
                        width: 100.h,
                        margin: EdgeInsets.only(bottom: 2.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Color(0xffb2b2b2), width: 1.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.h, right: 1.h, top: 0.9.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: CommonText(
                                label: 'Select Gender',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: sonGender,
                              items: GenderList.map((item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {},
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  sonGender = _v!;
                                });
                              }),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: commonboxshadowBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 0.h),
                    title: CommonText(
                      label: 'Relationship : Child 2',
                      textStyle: labelTextStyleBlackReguler16,
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Select Relationship')],
                      ),
                      Container(
                        height: 5.5.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Color(0xffb2b2b2), width: 1.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.h, right: 1.h, top: 0.9.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: CommonText(
                                label: 'Select Relationship',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: childtworelation,
                              items: RelationShipList.map((item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {},
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  childtworelation = _v!;
                                });
                              }),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Name')],
                      ),
                      TextFormField(
                        controller: daughterdependentName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: 'Dependent Name',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Date of Birth')],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color(0xffe4e4e4),
                            ),
                          ),
                          hintText: _daughterselectedDate != null
                              ? _daughterselectedDate
                                  .toString()
                                  .replaceRange(11, 23, '')
                              : 'Date of Birth',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xffb2b2b2),
                              size: 2.3.h,
                            ),
                            onPressed: () {
                              setState(() {
                                _daughterpresentDatePicker();
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MemberHeaderText('Gender')],
                      ),
                      Container(
                        height: 5.5.h,
                        width: 100.h,
                        margin: EdgeInsets.only(bottom: 2.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Color(0xffb2b2b2), width: 1.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.h, right: 1.h, top: 0.9.h),
                          child: DropdownButton(
                              focusColor: Colors.white,
                              menuMaxHeight: 300.0,
                              isExpanded: true,
                              isDense: true,
                              hint: CommonText(
                                label: 'Select Gender',
                                textStyle: labelTextStyleGreyReguler14,
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: daughterGender,
                              items: GenderList.map((item) {
                                return DropdownMenuItem(
                                    enabled: true,
                                    onTap: () {},
                                    value: item.toString(),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          overflow: TextOverflow.ellipsis),
                                    ));
                              }).toList(),
                              onChanged: (String? _v) {
                                setState(() {
                                  daughterGender = _v!;
                                });
                              }),
                        ),
                      ),
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  DateTime? _spouseselectedDate;

  void _spousepresentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1947),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _spouseselectedDate = pickedDate;
      });
    });
  }

  DateTime? _sonselectedDate;

  void _sonpresentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1947),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _sonselectedDate = pickedDate;
      });
    });
  }

  DateTime? _daughterselectedDate;

  void _daughterpresentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1947),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _daughterselectedDate = pickedDate;
      });
    });
  }

  DateTime? _employeeselectedDate;

  void _employeepresentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1947),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _employeeselectedDate = pickedDate;
      });
    });
  }
}
