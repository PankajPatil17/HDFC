import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';

class HomePageController extends GetxController {
  var SignUpcontroller = Get.put(SignUpController());
  var notificationCount;

  var Usermobilenumber;

  List BannerImages = [].obs;

  HomePageImages() async {
    http.Response response = await http.get(
        Uri.parse(
            '${BASE_URL}claim_adminpanel/api/api_details/dashboardscreen'),
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        });
    var decodedResponse = json.decode(response.body);
    BannerImages = decodedResponse['Home_slider'];
  }

  List HealthName = [
    'Policy Details',
    'My Coverage',
    'Network Hospital',
    'Intimate My Claims',
    'Download Forms',
    'Members Covered',
    'My Claim Status',
  ];

  List HealthImage = [
    'assets/Images/Policy-details.svg',
    'assets/Images/My_Coverage.svg',
    'assets/Images/Network_hospital.svg',
    'assets/Images/Intimate_my_claim.svg',
    'assets/Images/Download_form.svg',
    'assets/Images/Members-Covered.svg',
    'assets/Images/Claim-Status.svg',
  ];
}
