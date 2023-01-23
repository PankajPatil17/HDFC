import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';

class HomePageController extends GetxController {
  List networkhospitalimages = [].obs;
  List activepackages = [].obs;
  List teleconsultation = [].obs;
  List symptoms = [].obs;
  List cityList = [];
  var videos;
  List packagesListDetails = [].obs;
  List packagesList = [].obs;
  List CheckPackageaval = [];
  var callFunctionmessage;
  var SignUpcontroller = Get.put(SignUpController());
  var notificationCount;
  List blogs = [].obs;
  List blogsdetail = [].obs;
  List onboardingimages = [].obs;
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
}
