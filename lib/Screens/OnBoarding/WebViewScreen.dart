// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/WebViewController.dart';
import 'package:hdfc_bank/Generic/Common/CommonLoader.dart';
import 'package:hdfc_bank/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  final url;
  final labelname;
  WebviewScreen({super.key, this.url, this.labelname});

  final webControl = Get.put(WebController());
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        title: CommonText(
          label: labelname,
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.h,
          color: Colors.grey.shade100,
          child: Stack(
            children: [
              WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onPageStarted: (url) async {
                  webControl.loading.value = true;
                  await controller.runJavascript(
                      "document.getElementsByTagName('employee-benefit-logo-strip-cover header-em-wrapper')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('row align-items-center')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('m-mega-footer-main-wrap')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('cg-menu-below cg-logo-left cg-menu-left')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('emed-footer-wrapper')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByTagName('emed-footer-shape')[0].style.display='none'");
                },
                onPageFinished: (webAddress) async {
                  await controller.runJavascript(
                      "document.getElementsByTagName('employee-benefit-logo-strip-cover header-em-wrapper')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('row align-items-center')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('m-mega-footer-main-wrap')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('mob-fix-foot-wrap fixed-bottom')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('cg-menu-below cg-logo-left cg-menu-left')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('emed-footer-wrapper')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByTagName('emed-footer-shape')[0].style.display='none'");
                  webControl.loading.value = false;
                },
              ),
              Obx(() {
                return webControl.loading.value
                    ? const CustomLoader()
                    : const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
