import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:odin/Controller/BooksDignoSticsController.dart';
import 'package:odin/Generic/Common/CommonBottomBar.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';

class BookDignosticsMainScreen extends StatefulWidget {
  const BookDignosticsMainScreen({super.key});

  @override
  State<BookDignosticsMainScreen> createState() =>
      _BookDignosticsMainScreenState();
}

class _BookDignosticsMainScreenState extends State<BookDignosticsMainScreen> {
  var BookDiagnoController = Get.put(BookController());
  var changetabcolor;
  var imgpath;
  FilePickerResult? result;
  TextEditingController DignoSearch = TextEditingController();
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
                  SvgPicture.asset(
                    'assets/Images/Odin_Logo.svg',
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
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diagnostics',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            color: Color(0xff363636)),
                      ),
                      Container(
                        height: 6.5.h,
                        width: 100.h,
                        margin: EdgeInsets.symmetric(vertical: 1.5.h),
                        child: TextFormField(
                          controller: DignoSearch,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 1.h, left: 1.h),
                              hintText: 'Search Test / Diagnostics Package',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xffb2b2b2),
                                  fontFamily: 'Poppins'),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe4e4e4), width: 1.0),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe4e4e4), width: 0.5),
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor: Colors.white,
                              suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: SvgPicture.asset(
                                      'assets/Images/Search.svg'),
                                ),
                              ),
                              filled: true),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async {
                            result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result == null) {
                              print("No file selected");
                            } else {
                              result?.files.forEach((element) {
                                print("path${element.path}");
                                imgpath = element.path;
                              });
                            }

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Please Wait",
                                    style: labelTextStyleBlackReguler16,
                                  ),
                                );
                              },
                            );

                            Future.delayed(Duration(seconds: 7), () {
                              Get.back();
                            });

                            Future.delayed(Duration(milliseconds: 7100), () {
                              BookDiagnoController.UploadImage(img: imgpath);
                            });
                          },
                          child: Text(
                            'Upload prescription',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                color: Color(0xff4CB74D)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('Book Diagnostic Test',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                          )),
                      Container(
                        height: 19.h,
                        width: 100.h,
                        margin: EdgeInsets.only(top: 0.5.h),
                        child: FutureBuilder(
                          future:
                              BookDiagnoController.BookDignosticListFunction(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  BookDiagnoController.BookDignosticList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      // Get.to(BookDignoNextScreen(
                                      //     labelname: BookDiagnoController
                                      //         .BookDignosticList[index]['cat_name'],
                                      //     id: BookDiagnoController
                                      //         .BookDignosticList[index]['cat_id']));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 13.h,
                                          width: 13.6.h,
                                          margin: EdgeInsets.only(
                                              bottom: 1.h,
                                              right: 1.9.h,
                                              top: 1.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                              'https://medibhai.com/assets/uploads/cat_img/${BookDiagnoController.BookDignosticList[index]['cat_logo']}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.5.h,
                                          child: Center(
                                            child: Text(
                                              BookDiagnoController
                                                      .BookDignosticList[index]
                                                  ['cat_name'],
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins'),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                      Text('Commonly Booked Test',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                          )),
                      Container(
                        height: 25.4.h,
                        width: 100.h,
                        margin: EdgeInsets.only(top: 0.5.h, bottom: 1.h),
                        child: FutureBuilder(
                          future: BookDiagnoController
                              .CommonlyBookTestListFunction(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemCount: BookDiagnoController
                                  .CommonlyBookTestList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   Get.to(BookDiagnoDetailScreen(
                                    //       labelname: BookDiagnoController
                                    //               .CommonlyBookTestList[index]
                                    //           ['test_heading'],
                                    //       id: BookDiagnoController
                                    //               .CommonlyBookTestList[index]
                                    //           ['test_id'],
                                    //       profImage:
                                    //           'https://medibhai.com/assets/uploads/test_img/${BookDiagnoController.CommonlyBookTestList[index]['test_logo']}'));
                                    // });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 1.h, top: 1.h, bottom: 1.h),
                                    padding: EdgeInsets.all(1.2.h),
                                    width: 26.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xffe4e4e4),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 0.2)
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 11.h,
                                          width: 100.h,
                                          margin: EdgeInsets.only(bottom: 1.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                              'https://medibhai.com/assets/uploads/test_img/${BookDiagnoController.CommonlyBookTestList[index]['test_logo']}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        CommonText(
                                          label:
                                              'Medibhai Price : ${BookDiagnoController.CommonlyBookTestList[index]['test_medi_price']} ₹',
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp,
                                              color: Color(0xff4CB74D),
                                              fontFamily: 'Poppins'),
                                          maxLines: 2,
                                        ),
                                        CommonText(
                                          label: BookDiagnoController
                                                  .CommonlyBookTestList[index]
                                              ['test_heading'],
                                          maxLines: 2,
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp,
                                              color: Colors.black,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Text('Diagnostic Health Packages',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                          )),
                      Container(
                        height: 25.5.h,
                        width: 100.h,
                        margin: EdgeInsets.only(top: 0.5.h, bottom: 1.h),
                        child: FutureBuilder(
                          future: BookDiagnoController
                              .DiagnoHealthPkgListFunction(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: BookDiagnoController
                                  .DiagnoHealthPkgList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   Get.to(BookDiagnoPkgDetailScreen(
                                    //     labelname: BookDiagnoController
                                    //             .DiagnoHealthPkgList[index]
                                    //         ['package_name'],
                                    //     id: BookDiagnoController
                                    //             .DiagnoHealthPkgList[index]
                                    //         ['pack_id'],
                                    //     profImage:
                                    //         'https://medibhai.com/assets/uploads/pack_img/${BookDiagnoController.DiagnoHealthPkgList[index]['pack_logo']}',
                                    //   ));
                                    // });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 1.h, top: 1.h, bottom: 1.h),
                                    padding: EdgeInsets.all(1.2.h),
                                    width: 26.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xffe4e4e4),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 0.2)
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 11.h,
                                          width: 100.h,
                                          margin: EdgeInsets.only(bottom: 1.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                              'https://medibhai.com/assets/uploads/pack_img/${BookDiagnoController.DiagnoHealthPkgList[index]['pack_logo']}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            CommonText(
                                              label:
                                                  'Price : ${BookDiagnoController.DiagnoHealthPkgList[index]['pack_medi_price']} ₹',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins'),
                                              maxLines: 2,
                                            ),
                                            CommonText(
                                              label:
                                                  ' MRP: ${BookDiagnoController.DiagnoHealthPkgList[index]['pack_mrp']} ₹',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                  color: Colors.green,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontFamily: 'Poppins'),
                                              maxLines: 2,
                                            )
                                          ],
                                        ),
                                        CommonText(
                                          label: BookDiagnoController
                                                  .DiagnoHealthPkgList[index]
                                              ['package_name'],
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp,
                                              color: Colors.black,
                                              fontFamily: 'Poppins'),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Text('How it works',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: 17.h,
                            width: 18.5.h,
                            padding:
                                EdgeInsets.only(bottom: 1.3.h, right: 1.3.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffe4e4e4),
                                ),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 0.2)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('assets/Images/img1.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.8.h, bottom: 2.h, left: 1.5.h),
                                      child: SvgPicture.asset(
                                          'assets/Images/Test booking.svg'),
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Test Booking Slotsssds',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Center(
                                  child: Text(
                                    'Select the specialty or symptoms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/Images/arrow1.svg'),
                          Container(
                            // height: 17.h,
                            width: 18.5.h,
                            padding:
                                EdgeInsets.only(bottom: 1.3.h, right: 1.3.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffe4e4e4),
                                ),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 0.2)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('assets/Images/img2.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.8.h, bottom: 2.h, left: 1.5.h),
                                      child: SvgPicture.asset(
                                          'assets/Images/Test booking.svg'),
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Health Expert Deputed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Center(
                                  child: Text(
                                    'Select the specialty or symptoms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 7.h),
                            child: SvgPicture.asset('assets/Images/arrow2.svg'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: 17.h,
                            width: 18.5.h,
                            padding:
                                EdgeInsets.only(bottom: 1.3.h, right: 1.3.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffe4e4e4),
                                ),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 0.2)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('assets/Images/img4.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.8.h, bottom: 2.h, left: 1.5.h),
                                      child: SvgPicture.asset(
                                          'assets/Images/Test booking.svg'),
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Test\nInvestigation',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Center(
                                  child: Text(
                                    'Select the specialty or symptoms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/Images/arrow3.svg'),
                          Container(
                            // height: 17.h,
                            width: 18.5.h,
                            padding:
                                EdgeInsets.only(bottom: 1.3.h, right: 1.3.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffe4e4e4),
                                ),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 0.2)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('assets/Images/img3.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.8.h, bottom: 2.h, left: 1.5.h),
                                      child: SvgPicture.asset(
                                          'assets/Images/Test booking.svg'),
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Sample\nCollection',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Center(
                                  child: Text(
                                    'Select the specialty or symptoms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: SvgPicture.asset('assets/Images/arrow4.svg'),
                          ),
                        ],
                      ),
                      Container(
                        // height: 17.h,
                        margin: EdgeInsets.only(left: 8.h),
                        width: 18.5.h,
                        padding: EdgeInsets.only(bottom: 1.3.h, right: 1.3.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xffe4e4e4),
                            ),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 0.2)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/Images/img5.svg'),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 2.8.h, bottom: 2.h, left: 1.5.h),
                                  child: SvgPicture.asset(
                                      'assets/Images/Test booking.svg'),
                                )
                              ],
                            ),
                            Center(
                              child: Text(
                                'E-Reports',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Center(
                              child: Text(
                                'Select the specialty or symptoms',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CommonBottomBar(changetabcolor: changetabcolor)
          ],
        )));
  }
}
