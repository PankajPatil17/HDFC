import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';
import 'package:hdfc_bank/Screens/OnBoarding/OnBoardingScreen.dart';
import 'package:hdfc_bank/Screens/SignUp/CorporateCreateAccount.dart';
import 'package:hdfc_bank/Screens/SignUp/CorporateEmployeeSignUp.dart';
import 'package:hdfc_bank/Screens/SignUp/Registration_Verify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hdfc_bank/Screens/SignUp/OtpVerify.dart';

class SignUpController extends GetxController {
  var currentUserToken;
  var userstatusReg;
  var message;
  var CorCropoName;
  var CorFullName;
  var CorId;

  gettokenfunction() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    currentUserToken = _prefs.getString('currentUserToken');
  }

  Future logInFunction({mobNum, deviceid}) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/dispatch_otp'),
      body: {
        "mobile_no": mobNum,
        "device_id": deviceid,
        "broker_side_id": "25"
      },
    );
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (decodedResponse['status'] == true) {
      Get.back();
      userstatusReg = 0;
      Get.to(OtpVerify(mobNum: mobNum, deviceid: deviceid));
    } else if (decodedResponse['status'] == false) {
      Get.back();
      userstatusReg = 1;
      Get.back();
      Get.to(CorporateEmployeeSignUp());
    }
  }

  Future SignUpRegiFunction({mobNum, deviceid, fname, email, fcmkey}) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/api_register'),
      body: {
        "mobile_no": mobNum,
        "device_id": deviceid,
        "name": fname,
        "email": email,
        "source": "4",
        "fcmkey": fcmkey
      },
    );
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == true) {
      Get.to(OtpVerify(mobNum: mobNum, deviceid: deviceid));
      print(decodedResponse);
    } else {
      Fluttertoast.showToast(
          msg: 'Fields must contain a unique value',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print(decodedResponse);
  }

  Future OtpVerifyFunction({mobNum, deviceid, otp, fcmkey}) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/matching_otp'),
      body: {
        "device_id": deviceid,
        "mobile_no": mobNum,
        "otp": otp,
        "fcmkey": fcmkey,
        "source": "4"
      },
    );
    var decodedResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.back();
    }
    if (decodedResponse['status'] == true) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('currentUserToken', decodedResponse['access_token']);
      currentUserToken = _prefs.getString('currentUserToken');
      print('token--${currentUserToken}');
      print(response.body);
      Get.offAll(OnBoardingScreen());
    } else {
      Get.snackbar("Wrong OTP", "Please Enter a Valid OTP",
          backgroundColor: Color(0xffFFFFFF));
    }
  }

  //------------------------Corporate emp registration-----------------------------------------//

  Future CorporateEmpReg({empId, corporatecode}) async {
    final response = await http.post(
      Uri.parse(
          '${BASE_URL}claim_adminpanel/api/api_details/corporate_register'),
      body: {
        "employee_id": empId,
        "official_email": corporatecode,
      },
    );
    var decodedResponse = json.decode(response.body);
    CorCropoName = decodedResponse['data']['corporate_name'];
    CorFullName = decodedResponse['data']['fullname'];
    CorId = decodedResponse['data']['id'];
    if (response.statusCode == 200) {
      Get.to(CorporateCreateAccount(corpId: CorId.toString()));
    } else if (CorCropoName == null) {
      Fluttertoast.showToast(
          msg: 'Something went Wrong',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print(decodedResponse);
  }

  Future CorporateSendOtp({mobile, deviceid, userid, email_id}) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/corporate_check'),
      body: {"mobile": mobile, "broker_side_id": "25"},
    );
    var decodedResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: decodedResponse['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.to(Registration_Verify(
          mobNum: mobile, deviceid: deviceid, userid: userid, email: email_id));
    }
    Fluttertoast.showToast(
        msg: decodedResponse['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        fontSize: 16.0);
    print(decodedResponse);
  }

  Future RegistrationVerifyOTP(
      {mobNum, deviceid, otp, fcmkey, email, userid}) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/corporate_verify'),
      body: {
        "device_id": deviceid,
        "mobile": mobNum,
        "otp": otp,
        "fcmkey": fcmkey,
        "source": "4",
        "email_id": email,
        "userid": userid
      },
    );
    var decodedResponse = json.decode(response.body);
    print("11111111111111111111${mobNum}");
    if (response.statusCode == 200) {
      Get.back();
      print("11111111111111111111${response.body}");
    }
    if (decodedResponse['status'] == true) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('currentUserToken', decodedResponse['access_token']);
      currentUserToken = _prefs.getString('currentUserToken');
      print('token--${currentUserToken}');
      print(response.body);
      Get.offAll(OnBoardingScreen());
    } else {
      Get.snackbar("Wrong OTP", "Please Enter a Valid OTP",
          backgroundColor: Color(0xffFFFFFF));
    }
  }
}
