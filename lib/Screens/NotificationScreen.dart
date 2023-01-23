// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/DeviceInfoNotifiController.dart';
import 'package:hdfc_bank/Controller/HomePageController.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var DeviceFunctcontroller = Get.put(DeviceInfoNotifiController());
  var HomeController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: BackButton(color: Colors.black),
          title: CommonText(
            label: "Notifications",
            textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
                fontFamily: 'Poppins'),
          ),
        ),
        body: HomeController.notificationCount == 0 ||
                HomeController.notificationCount == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/Images/No_Notification.svg'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CommonText(
                      label: 'No Notifications Here',
                      textStyle: labelTextStyleReguler19,
                    )
                  ],
                ),
              )
            : Container(
                height: 100.h,
                width: 100.h,
                child: FutureBuilder(
                  future: DeviceFunctcontroller.NotificationListFunction(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: DeviceFunctcontroller.Notification.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: DeviceFunctcontroller.Notification[index]
                                      ['is_seen'] ==
                                  1
                              ? Colors.white
                              : Colors.grey.shade300,
                          child: ExpansionTile(
                            onExpansionChanged: (value) {
                              setState(() {
                                DeviceFunctcontroller.NotificationSeenFunction(
                                    notId: DeviceFunctcontroller
                                        .Notification[index]['id']);
                              });
                            },
                            leading: DeviceFunctcontroller.Notification[index]
                                        ['image'] ==
                                    null
                                ? Image.network(
                                    "https://medibhai.com/assets/responsive/images/mlogo.png")
                                : Image.network(
                                    "${DeviceFunctcontroller.Notification[index]['image']}"),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DeviceFunctcontroller.Notification[index]
                                            ['title'] ==
                                        null
                                    ? ''
                                    : "${DeviceFunctcontroller.Notification[index]['title']}"),
                                Text(
                                  DeviceFunctcontroller.Notification[index]
                                              ['description'] ==
                                          null
                                      ? ''
                                      : DeviceFunctcontroller
                                          .Notification[index]['description']
                                          .toString()
                                          .replaceAll('<p>', '')
                                          .replaceAll('</p>', ''),
                                  style: labelTextStyleBlackReguler14,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(1.5.h),
                                child: HtmlWidget(
                                  '''
                             ${DeviceFunctcontroller.Notification[index]['description']}
                            ''',
                                  customStylesBuilder: (element) {
                                    if (element.classes.contains('foo')) {
                                      return {'color': 'red'};
                                    }
                                    return null;
                                  },
                                  enableCaching: true,
                                  onErrorBuilder: (context, element, error) =>
                                      Text('$element error: $error'),
                                  onLoadingBuilder:
                                      (context, element, loadingProgress) =>
                                          CircularProgressIndicator(),
                                  renderMode: RenderMode.column,
                                  textStyle: labelTextStyleBlackReguler16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                )));
  }
}
