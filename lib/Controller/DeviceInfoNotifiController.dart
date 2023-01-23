// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';

class DeviceInfoNotifiController extends GetxController {
  List Notification = [].obs;
  var SignUpcontroller = Get.put(SignUpController());
  var deviceId;
  Future getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor!;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id;
    } else {
      deviceId = 'null';
    }
    return deviceId;
  }

  NotificationListFunction() async {
    http.Response response = await http
        .get(Uri.parse('${BASE_URL}api/notification_api/index'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponse = json.decode(response.body);
    Notification = decodedResponse['notification'];
  }

  NotificationSeenFunction({notId}) async {
    http.Response response = await http.post(
        Uri.parse('${BASE_URL}api/notification_api/update_status'),
        body: {
          "notification_id": notId.toString()
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        });
  }
}
