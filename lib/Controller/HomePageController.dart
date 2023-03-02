import 'dart:convert';

import 'package:get/get.dart';
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:http/http.dart' as http;

import '../Generic/Constant/variables.dart';

class HomePageController extends GetxController {
  var SignUpcontroller = Get.put(SignUpController());
  var notificationCount;
  var GetAllHomeScrenUidata;
  var Usermobilenumber;

  Future gethomescreenUiData() async {
    final response = await http.post(
      Uri.parse('${DEV_URL}api/Home_index/get_app_screen'),
      headers: {'Authorization': SignUpcontroller.currentUserToken},
      body: {'broker_id': '32', 'screen_name': 'home'},
    );
    var decodedResponse = json.decode(response.body);
    GetAllHomeScrenUidata = decodedResponse['data']['home_screen'];
  }

  List BannerImages = [
    'assets/Images/Banner.png',
    'assets/Images/Banner_One.png'
  ];
}
