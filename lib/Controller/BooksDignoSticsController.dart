// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:odin/Controller/SignUpController.dart';
import 'package:odin/Generic/Constant/variables.dart';

class BookController extends GetxController {
  var SignUpcontroller = Get.put(SignUpController());
  List BookDignosticSecondList = [].obs;
  List CommonlyBookTestList = [].obs;
  List BookDignosticList = [].obs;
  List DiagnoHealthPkgList = [].obs;

  Future UploadImage({img}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${BASE_URL}api/home_index/upload_prescription'));
    request.headers
        .addAll({"Authorization": "${SignUpcontroller.currentUserToken}"});
    request.fields['type'] = 'diagnostics';
    request.files
        .add(await http.MultipartFile.fromPath("prescription_file", "${img}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      Get.snackbar("Success",
          "Prescription uploaded successfully, we'll get back you soon!");
    } else {
      Get.snackbar(
        "Error",
        "The filetype you are attempting to upload is not allowed.",
      );
    }
  }

  Future BookDignosticListFunction() async {
    http.Response response = await http
        .get(Uri.parse('${BASE_URL}api/diagnostics/category'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponse = json.decode(response.body);
    BookDignosticList = decodedResponse['data'];
  }

  Future CommonlyBookTestListFunction() async {
    http.Response response =
        await http.get(Uri.parse('${BASE_URL}api/diagnostics/test'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponse = json.decode(response.body);
    CommonlyBookTestList = decodedResponse['data'];
  }

  Future DiagnoHealthPkgListFunction() async {
    http.Response response = await http
        .get(Uri.parse('${BASE_URL}api/diagnostics/package'), headers: {
      "Authorization": SignUpcontroller.currentUserToken,
    });
    var decodedResponse = json.decode(response.body);
    DiagnoHealthPkgList = decodedResponse['data'];
  }
}
