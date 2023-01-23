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

  @override
  void onInit() async {
    OnBoardingImages();
    super.onInit();
  }

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

  OnBoardingImages() async {
    http.Response response = await http.get(
      Uri.parse('${BASE_URL}api/onboarding'),
    );
    var decodedResponse = json.decode(response.body);
    onboardingimages = decodedResponse['images'];
  }

  NetworkHospitalImages() async {
    http.Response response =
        await http.get(Uri.parse('${BASE_URL}api/home_index/index'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponseImages = json.decode(response.body);
    networkhospitalimages = decodedResponseImages['network_hospitals'];
    videos = decodedResponseImages['videos']['status'];
    CheckPackageaval = decodedResponseImages['my_package']['packages'];
    notificationCount = decodedResponseImages['notification_count'];
    razorPay_Key = decodedResponseImages['razorpay_keys']['key'];
  }

  TeleConsultationList() async {
    http.Response response =
        await http.get(Uri.parse('${BASE_URL}teleconsultation-list'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponse = json.decode(response.body);
    teleconsultation = decodedResponse['tele_departments']['teleconsultaton'];
    symptoms = decodedResponse['tele_departments']['symptoms'];
  }

  getCityList() async {
    http.Response response = await http.get(
        Uri.parse('${BASE_URL}claim_adminpanel/api/api_details/getlocation'),
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        });
    var decodedResponse = json.decode(response.body);
    cityList = decodedResponse['location'];
  }

  CallFucntion({usermobnum, requestType}) async {
    http.Response response =
        await http.post(Uri.parse('${BASE_URL}general/request_support'), body: {
      // "support_request_no": usermobnum == null ? '0000000000' : usermobnum,
      "support_request_no": usermobnum,
      "support_request_type": requestType
    });
    var decodedResponse = json.decode(response.body);
    callFunctionmessage = decodedResponse['message'];
  }

  Activepackages() async {
    http.Response response =
        await http.get(Uri.parse('${BASE_URL}api/home_index/index'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponse = json.decode(response.body);
    packagesList = decodedResponse['my_package']['packages'];
  }

  ActivepackagesDetails({id}) async {
    http.Response response = await http.get(
        Uri.parse(
            '${BASE_URL}api/home_index/getPackageDetails?package_id=${id}'),
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        });
    var decodedResponse = json.decode(response.body);
    packagesListDetails = decodedResponse['data']['data'];
  }

  BlogArticles() async {
    http.Response response = await http.post(
        Uri.parse('${BASE_URL}api/home_index/health_feed_blog'),
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        },
        body: {});

    var decodedResponse = json.decode(response.body);
    blogs = decodedResponse['health_feed'];
  }

  BlogArticlesDetails(id) async {
    http.Response response = await http.post(
        Uri.parse('${BASE_URL}api/home_index/health_feed_blog'),
        headers: {
          "Authorization": SignUpcontroller.currentUserToken,
        },
        body: {
          "id": id.toString()
        });

    var decodedResponse = json.decode(response.body);
    blogsdetail = decodedResponse['health_feed'];
  }
}
