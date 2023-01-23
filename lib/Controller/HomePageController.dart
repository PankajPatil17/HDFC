import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';

class HomePageController extends GetxController {
  var SignUpcontroller = Get.put(SignUpController());
  var notificationCount;

  var Usermobilenumber;

  List HealthName = [
    'Policy\nDetails',
    'My\nCoverage',
    'Network\nHospital',
    'Intimate\nMy Claims',
    'Download\nForms',
    'Members\nCovered',
    'My Claim\nStatus',
  ];

  List HealthImage = [
    'assets/Images/Policy-details.svg',
    'assets/Images/My_Coverage.svg',
    'assets/Images/Network_hospital.svg',
    'assets/Images/Intimate_my_claim.svg',
    'assets/Images/Download_form.svg',
    'assets/Images/Members_Covered.svg',
    'assets/Images/My_Claim_status.svg',
  ];

  List BannerImages = [
    'assets/Images/Banner.png',
    'assets/Images/Banner_One.png'
  ];
}
