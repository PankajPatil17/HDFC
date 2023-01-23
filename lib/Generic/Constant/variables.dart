import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const ScrollPhysics listViewPhysics = BouncingScrollPhysics();
const ScrollPhysics noPhysics = NeverScrollableScrollPhysics();

const String BASE_URL = 'https://medibhai.com/';
String razorPay_Key = '';

const Transition transitoineffect = Transition.rightToLeftWithFade;

const String RS = '₹';
var savedcityname = 'Mumbai';

var isLoading = false.obs;

String cityName = 'def';

String callBackURL = '';
int insert_ID = 0;
String module_ID = '';

//9021434305
//122341

Future<String?> getFcmToken() async {
  if (Platform.isIOS) {
    String? fcmKey = await FirebaseMessaging.instance.getAPNSToken();
    return fcmKey;
  }
  String? fcmKey = await FirebaseMessaging.instance.getToken();
  return fcmKey;
}
// List<String> cartProductName = [];

const List<String> genderList = [
  'Male',
  'Female',
  'Other',
];
const List<String> relationList = [
  'Self',
  'Spouse',
  'Child',
  'Mother',
  'Father',
  'Other',
];
