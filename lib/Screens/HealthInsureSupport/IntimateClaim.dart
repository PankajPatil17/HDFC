import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/HealthInsureController.dart';
import 'package:hdfc_bank/Generic/Common/CommonBottomBar.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:hdfc_bank/Generic/Custom/Custom_Icon_Button.dart';
import 'package:sizer/sizer.dart';

class IntimateClaim extends StatefulWidget {
  const IntimateClaim({super.key});

  @override
  State<IntimateClaim> createState() => _IntimateClaimState();
}

class _IntimateClaimState extends State<IntimateClaim> {
  var HealthInauranceController = Get.put(HealthInsuranceSupportController());
  var changeTab = '';
  var policytype;
  var changetabcolor;
  String? name;
  var imgpath = ''.obs;
  DateTime? _selectedDate;

  FilePickerResult? result;
  TextEditingController reasonforclaim = TextEditingController();
  TextEditingController nameofhospital = TextEditingController();
  TextEditingController hospitaladdress = TextEditingController();
  TextEditingController pinocde = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  TextEditingController remark = TextEditingController();
  @override
  void initState() {
    changetabcolor = 'home';
    super.initState();
  }

  var patientname;
  final formKey = GlobalKey<FormState>();
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
                  SvgPicture.asset(
                    'assets/Images/hdfc_Logo.png',
                    height: 3.h,
                    width: 3.h,
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/Images/Notification.svg'),
                ],
              ),
            )),
            preferredSize: Size(100.h, 20.h)),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future: HealthInauranceController
                                .PolicyListingFunction(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              return snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? CustomLoader()
                                  : Row(
                                      children: [
                                        Text(
                                          'Policy Type',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                              fontFamily: 'Inter'),
                                        ),
                                        Container(
                                          height: 5.h,
                                          width: 30.h,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: HealthInauranceController
                                                .policyList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    changeTab = '';
                                                    policytype =
                                                        HealthInauranceController
                                                                    .policyList[
                                                                index]
                                                            ['policy_type'];
                                                    HealthInauranceController
                                                            .indexvalue =
                                                        HealthInauranceController
                                                            .policyList
                                                            .indexOf(
                                                                HealthInauranceController
                                                                        .policyList[
                                                                    index]);
                                                  });
                                                },
                                                child: HealthInauranceController
                                                                        .policyList[
                                                                    index][
                                                                'policy_type'] ==
                                                            'GPA' ||
                                                        HealthInauranceController
                                                                        .policyList[
                                                                    index][
                                                                'policy_type'] ==
                                                            'GTL'
                                                    ? Container()
                                                    : Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 5.h,
                                                        width: 8.h,
                                                        margin: EdgeInsets.only(
                                                            left: 1.h),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                                width: 1.0,
                                                                color:
                                                                    mainBlue),
                                                            color: HealthInauranceController
                                                                        .indexvalue ==
                                                                    HealthInauranceController
                                                                        .policyList
                                                                        .indexOf(HealthInauranceController.policyList[
                                                                            index])
                                                                ? mainBlue
                                                                : Colors
                                                                    .transparent),
                                                        child: CommonText(
                                                          label:
                                                              '${HealthInauranceController.policyList[index]['policy_type']}',
                                                          textStyle: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12.sp,
                                                              color: HealthInauranceController
                                                                          .indexvalue ==
                                                                      HealthInauranceController
                                                                          .policyList
                                                                          .indexOf(HealthInauranceController.policyList[
                                                                              index])
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontFamily:
                                                                  'Inter'),
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                            }),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Text(
                          'Intimate My Claims',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              fontFamily: 'Inter',
                              color: mainBlue),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        FutureBuilder(
                          future: HealthInauranceController.MembersCovered(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return Container(
                              alignment: Alignment.center,
                              height: 6.h,
                              width: 100.h,
                              margin: EdgeInsets.only(top: 1.5.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffe4e4e4).withOpacity(0.5),
                                    spreadRadius: 1.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 1.h, right: 1.h),
                                child: DropdownButton(
                                    focusColor: Colors.white,
                                    menuMaxHeight: 300.0,
                                    isExpanded: true,
                                    isDense: true,
                                    hint: Padding(
                                      padding: EdgeInsets.only(top: 2.0),
                                      child: CommonText(
                                        label: 'Select Patient Name',
                                        textStyle: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            fontFamily: 'Inter'),
                                      ),
                                    ),
                                    underline: Container(
                                      color: Colors.white,
                                    ),
                                    value: name,
                                    items: HealthInauranceController
                                        .memebrscovered
                                        .map((item) {
                                      return DropdownMenuItem(
                                          enabled: true,
                                          onTap: () {
                                            patientname =
                                                item['relationship_name'];
                                          },
                                          value: item['relationship_name']
                                              .toString(),
                                          child: Text(
                                            item['relationship_name'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ));
                                    }).toList(),
                                    onChanged: (String? _v) {
                                      setState(() {
                                        name = _v!;
                                      });
                                    }),
                              ),
                            );
                          },
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 6.h,
                          width: 100.h,
                          margin: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffe4e4e4).withOpacity(0.5),
                                spreadRadius: 1.5,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            // controller: hospitalnamecontroller,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 1.h, left: 1.h),
                                hintText: _selectedDate != null
                                    ? _selectedDate
                                        .toString()
                                        .replaceRange(9, 22, '')
                                    : 'Admission Date',
                                suffixIcon: IconButton(
                                  icon: Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color(0xffe4e4e4),
                                      size: 2.3.h,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _presentDatePicker();
                                    });
                                  },
                                ),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Color(0xffb2b2b2),
                                    fontFamily: 'Inter'),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                        Material(
                          elevation: 3.0,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            controller: nameofhospital,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              hintText: 'Name of The Hospital',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: Color(0xffb2b2b2),
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Material(
                            elevation: 3.0,
                            shadowColor: Colors.white,
                            child: TextFormField(
                              controller: hospitaladdress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0),
                                    borderRadius: BorderRadius.circular(6)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: 'Hospital Address',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Color(0xffb2b2b2),
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 5.h,
                              width: 21.5.h,
                              padding: EdgeInsets.all(1.h),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffe4e4e4).withOpacity(0.5),
                                    spreadRadius: 1.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: pinocde,
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: 'Pincode',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xffb2b2b2),
                                      fontFamily: 'Inter'),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 5.h,
                              padding: EdgeInsets.all(1.h),
                              width: 21.5.h,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffe4e4e4).withOpacity(0.5),
                                    spreadRadius: 1.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: city,
                                decoration: InputDecoration(
                                  hintText: 'City',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xffb2b2b2),
                                      fontFamily: 'Inter'),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Material(
                          elevation: 3.0,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            controller: state,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              hintText: 'State',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: Color(0xffb2b2b2),
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Material(
                          elevation: 3.0,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            controller: reasonforclaim,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              hintText: 'Reason for claim',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: Color(0xffb2b2b2),
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Material(
                          elevation: 3.0,
                          shadowColor: Colors.white,
                          child: Container(
                            height: 11.6.h,
                            width: 100.h,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white),
                                  padding: EdgeInsets.all(1.h),
                                  child: CommonText(
                                    label: 'Upload Document   ',
                                    textStyle: labelTextStyleReguler16,
                                  ),
                                ),
                                Obx(() {
                                  String imgName = '';
                                  if (imgpath.value != '') {
                                    imgName = imgpath.value.split('/').last;
                                  }
                                  return imgpath.value == ''
                                      ? Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                result = await FilePicker
                                                    .platform
                                                    .pickFiles(
                                                        type: FileType.any,
                                                        allowMultiple: false);

                                                result?.files
                                                    .forEach((element) {
                                                  imgpath.value = element.path!;
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 1.5.h,
                                                  ),
                                                  Icon(Icons.upload_file),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(1.5.h),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: CommonText(
                                                      label: 'Browse',
                                                      textStyle:
                                                          labelTextStyleBlackReguler16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      : Container(
                                          margin:
                                              const EdgeInsets.only(top: 6.0),
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  color: Color(0xfff7f7f7),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  imgName.contains('.pdf')
                                                      ? Icons.picture_as_pdf
                                                      : Icons.photo,
                                                  size: 19.0,
                                                ),
                                              ),
                                              Text(
                                                imgName,
                                              ),
                                              CustomIconButton(
                                                icon: Icons.clear,
                                                color: Colors.red[50],
                                                diameter: 25.0,
                                                iconSize: 18.0,
                                                onTap: () {
                                                  imgpath.value = '';
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                }),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Material(
                          elevation: 3.0,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            controller: remark,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              hintText: 'Remark',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: Color(0xffb2b2b2),
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (formKey.currentState!.validate()) {
                                  HealthInauranceController
                                      .IntimateMyClaimFunction(
                                          patientname: name,
                                          reasonforclaim: reasonforclaim.text,
                                          nameofhospital: nameofhospital.text,
                                          pinocde: pinocde.toString(),
                                          city: city.text,
                                          state: state.text,
                                          remarks: remark.text,
                                          selectedDate:
                                              _selectedDate.toString(),
                                          fileupload: imgpath.value,
                                          hospitaladdress:
                                              hospitaladdress.text);
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 6.0.h,
                              width: 16.h,
                              margin: EdgeInsets.only(top: 2.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: mainBlue,
                              ),
                              child: CommonText(
                                label: 'Submit',
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CommonBottomBar(changetabcolor: changetabcolor)
            ],
          ),
        )));
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2050))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }
}
