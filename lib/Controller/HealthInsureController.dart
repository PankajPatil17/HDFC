// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:odin/Controller/SignUpController.dart';
import 'package:odin/Generic/Constant/variables.dart';
import 'package:odin/Screens/HomePage.dart';

class HealthInsuranceSupportController extends GetxController {
  var SignUpcontroller = Get.put(SignUpController());
  static var client = http.Client();
  var indexvalue = 0;
  List trackstatus = [].obs;
  var Letter = {}.obs;
  List cards = [].obs;
  List ContactList = [].obs;
  List memebrscovered = [].obs;
  List policyList = [].obs;
  List myCoverageList = [].obs;
  List MyAllClaims = [].obs;
  List DocDownloadList = [].obs;
  List SearchResult = [].obs;
  var LogoImage;
  var tpaid;
  var insurerId;

  List AllStateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal'
  ];

  List CityNamelist = [].obs;
  Future GetcityFunction(stateName) async {
    final response = await http.post(
        Uri.parse(
            '${BASE_URL}claim_adminpanel/api/api_details/tpahospitalcity'),
        body: {"state": stateName},
        headers: {"Authorization": SignUpcontroller.currentUserToken});
    var decodedResponse = json.decode(response.body);
    CityNamelist = decodedResponse['city'];
  }

  Future PolicyListingFunction() async {
    final response = await http.get(
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/policylisting'),
        headers: {
          "Authorization": SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
        });
    var decodedResponse = json.decode(response.body);
    policyList = decodedResponse['policies_listing'];
    LogoImage = decodedResponse['logo'];
    tpaid = decodedResponse['policies_listing'][indexvalue]['tpa_id'];
    insurerId = decodedResponse['policies_listing'][indexvalue]['insurer_id'];
  }

  Future PolicyMycoverageList() async {
    final response = await http.post(
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/autopopup'),
        body: {
          "policy_no": "${policyList[indexvalue]['policy_no']}",
          "insurer_id": "${policyList[indexvalue]['insurer_id']}",
          "product_id": "${policyList[indexvalue]['product_id']}",
          "sub_plan_id": "${policyList[indexvalue]['sub_plan_id']}",
          "suminsured_id": "${policyList[indexvalue]['suminsured_id']}"
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
        });
    var decodedResponse = json.decode(response.body);
    myCoverageList = decodedResponse['autopopup'];
  }

  Future MembersCovered() async {
    final response = await http.post(
        Uri.parse(
            'https://www.medibhai.com/claim_adminpanel/api/api_details/relationship'),
        body: {
          // "policy_no": "20012018"
          "policy_no": "${policyList[indexvalue]['policy_no']}"
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
        });
    var decodedResponse = json.decode(response.body);
    memebrscovered = decodedResponse['covered'];
  }

  Future CashlessCards() async {
    final response = await http.post(
        Uri.parse(
            'https://www.medibhai.com/claim_adminpanel/api/api_details/healthcard'),
        body: {
          // "policy_no": "20012018"
          "policy_no": "${policyList[indexvalue]['policy_no']}"
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
        });
    var decodedResponse = json.decode(response.body);
    cards = decodedResponse['health_card'];
  }

  IntimateMyClaimFunction(
      {patientname,
      reasonforclaim,
      nameofhospital,
      pinocde,
      city,
      state,
      remarks,
      selectedDate,
      fileupload,
      hospitaladdress}) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/Intimateclaim'));
    request.headers
        .addAll({"Authorization": "${SignUpcontroller.currentUserToken}"});
    request.fields['type'] = '3';
    request.fields['policy_no'] =
        policyList[indexvalue]['policy_no'].toString();
    request.fields['patientname'] = "${patientname}";
    request.fields['dateofhospitalization'] = '${selectedDate}';
    request.fields['hospitalname'] = nameofhospital;
    request.fields['causeofhospitalization'] = reasonforclaim;
    request.fields['type_claim'] = 'seft intimate';
    request.fields['hospitaladdress'] = hospitaladdress;
    request.fields['pincode'] = pinocde.toString();
    request.fields['city'] = city;
    request.fields['state'] = state;
    request.fields['remarks'] = remarks;

    request.files.add(
        await http.MultipartFile.fromPath("policy_files[]", "${fileupload}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      Get.to(HomePage());
    } else {
      Get.snackbar("Error", "Something went wrong, Please try again later");
    }
  }

  Future MyDocDownloadListFunction() async {
    final response = await http.post(
        Uri.parse(
            '${BASE_URL}claim_adminpanel/api/api_details/forms_and_documents'),
        body: {
          "policy_no": "${policyList[indexvalue]['policy_no']}"
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8",
        });
    var decodedResponse = json.decode(response.body);
    DocDownloadList = decodedResponse['utilities'];
  }

  Future MyClaimStatusListFunction() async {
    MyAllClaims = [];
    final response = await http.post(
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/Claimstatus'),
        body: {
          // "policy_no": "271000/50/21/10000340"
          "policy_no": "${policyList[indexvalue]['policy_no']}"
        },
        headers: {
          "Authorization":
              // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
              SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2ODE5IiwibG9nZ2VkX2luIjp0cnVlLCJkZXZpY2VfaWQiOiJkdXcxMjMzNDQiLCJlbXBsb3llZV9pZCI6IlRSSUc5IiwiY29ycG9yYXRlX2lkIjoiMTIxIiwiYnJva2VyX2lkIjoiMSIsInRpbWUiOjE2NDk2MTA0Njd9.9mj1b4AaB2zJj-Evjf0rB1A-UUdE4WJCzkwYECvzl0s"
        });
    var decodedResponse = json.decode(response.body);
    MyAllClaims = decodedResponse['my_claims'];
  }

  Future TrackYourClaim() async {
    final response = await http.post(
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/Claimstatus'),
        body: {
          "policy_no": "${policyList[indexvalue]['policy_no']}"
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        });
    var decodedResponse = json.decode(response.body);
    trackstatus = decodedResponse['my_claims'];
  }

  Future UploadTrackClaim({
    img,
    intimateno,
  }) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${BASE_URL}claim_adminpanel/api/api_details/upload_file_intimation_no'));
    request.headers
        .addAll({"Authorization": "${SignUpcontroller.currentUserToken}"});
    request.fields['policy_no'] =
        "${policyList[indexvalue]['policy_no'].toString()}";
    request.files
        .add(await http.MultipartFile.fromPath("policy_files[]", "${img}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      Get.snackbar("Success", "Files have been uploaded successfully");
    } else {
      Get.snackbar(
        "Error",
        "The filetype you are attempting to upload is not allowed.",
      );
    }
  }

  Future UploadDocument({img}) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/uploads'));
    request.headers
        .addAll({"Authorization": "${SignUpcontroller.currentUserToken}"});
    request.files
        .add(await http.MultipartFile.fromPath("policy_files[]", "${img}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      Get.snackbar("Success", "Files have been uploaded successfully");
    } else {
      Get.snackbar(
        "Error",
        "The filetype you are attempting to upload is not allowed.",
      );
    }
  }

  Future ContactUsFunction() async {
    final response = await http.post(
        Uri.parse(
            'https://medibhai.com/claim_adminpanel/api/api_details/esclation_matrix'),
        body: {
          "policy_no": "${policyList[indexvalue]['policy_no']}"
        },
        headers: {
          "Authorization": SignUpcontroller.currentUserToken
          // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEwMTAzNSIsImxvZ2dlZF9pbiI6dHJ1ZSwiZGV2aWNlX2lkIjoiOTc3NmZjY2MyOWQ2NDlhZSIsImVtcGxveWVlX2lkIjoiMTA0NDYiLCJjb3Jwb3JhdGVfaWQiOiIzMzEiLCJicm9rZXJfaWQiOiIyMyIsInRpbWUiOjE2NjM5OTkzMzZ9.VP9rPH2-5d1tuiY34nHIX61Snd4ACGntjw4ixFcjcp8"
        });
    var decodedResponse = json.decode(response.body);
    ContactList = decodedResponse['support_contacts'];
  }

  static Future<Map<String, dynamic>> fetchPincodeData(String pincode) async {
    String url = 'https://api.postalpincode.in/pincode/$pincode';
    var uri = Uri.parse(url);
    try {
      var response = await client.get(
        uri,
      );
      var body = json.decode(response.body);
      return body[0]['PostOffice'][0];
    } catch (e) {
      print("Error : $e");
      return {};
    }
  }
}
