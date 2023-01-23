import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hdfc_bank/Controller/SignUpController.dart';
import 'package:hdfc_bank/Generic/Constant/variables.dart';

class MyAccountProfileController extends GetxController {
  var SignUpcontroller = Get.put(SignUpController());
  var profileFullName;
  var profileEmail;
  var profileMobile;
  var UserID;
  var countNumberArray = <int>[].obs;
  var PendingwalletPoints;
  List WalletTransation = [].obs;
  List patientnamearray = [].obs;
  List agearray = [].obs;
  List genderarray = [].obs;
  List Relationshiparray = [].obs;
  var Useremail_id;
  var Useraddress;
  var Userlandmark;
  var Userpincode;
  var Usercity;
  var Uservisit_date;
  var Uservisit_time;
  List UserPackageData = [].obs;
  var UserApirespoTestDetails;
  var UserApirespoAddress;
  var UserApirespomobilenum;
  var UserApirespoVisitdate;
  var UserApirespoVisitTime;
  var UserApirespoCost;
  var UserApirespoDiscount;
  var UserApirespoCollectionCharegs;
  var UserApirespoFinalPrice;
  var ShowButton;
  var insertIdPlaceOrder;
  var tAmount = 0.obs;
  List GetDate = [];
  List getTime = [];
  List GetTodayTimeSlot = [];
  List GetTomorrowTimeSlot = [];
  List MyPkgDetails = [].obs;
  List MyOrderTeleconsultaionList = [].obs;
  List MyOrderDocotorAppoinmentList = [].obs;
  List MyOrderLabsTestList = [].obs;
  List MyMedicineOrder = [].obs;

  Future UserDetailsFunction() async {
    http.Response response = await http.get(
      Uri.parse('${BASE_URL}api/diagnostics/myaccount'),
      headers: {
        "Content-type": "application/json",
        "Authorization": SignUpcontroller.currentUserToken
      },
    );
    var decodedResponse = json.decode(response.body);
    profileFullName = decodedResponse['data']['profile_details']['fullname'];
    profileEmail = decodedResponse['data']['profile_details']['email'];
    profileMobile = decodedResponse['data']['profile_details']['mobile'];
    UserID = decodedResponse['data']['profile_details']['id'];
    PendingwalletPoints =
        decodedResponse['data']['wallet_data']['module_amount'];
    WalletTransation =
        decodedResponse['data']['wallet_data']['wallet_transaction'];
    MyPkgDetails = decodedResponse['data']['my_package_data'];
    MyOrderTeleconsultaionList = decodedResponse['data']['doctor_details'];
    MyOrderLabsTestList = decodedResponse['data']['order_details'];
    MyOrderDocotorAppoinmentList =
        decodedResponse['data']['doctor_appointment'];
    MyMedicineOrder = decodedResponse['data']['order_medicine'];
  }
}
