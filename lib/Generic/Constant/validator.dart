import 'package:get/get.dart';

var fullName = RegExp(r'[A-Za-z]+[ ][A-Za-z]+');

class Validator {
  static String? validName({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your name';
    } else if (value.trim().length < 4) {
      return 'Please Enter your full name';
    } else if (!value.trim().isAlphabetOnly) {
      return 'Please Enter your valid name';
    }
    return null;
  }

  static String? validMobNo({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your Mobile Number';
    } else if (value.trim().length != 10) {
      return 'Please Enter valid Mobile Number';
    } else if (!value.isNumericOnly) {
      return 'Please Enter valid Mobile Number';
    }
    return null;
  }

  static String? validEmail({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your Email ID';
    } else if (!value.isEmail) {
      return 'Please Enter valid Email ID';
    }
    return null;
  }

  static String? validAddress({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your Address';
    } else if (value.trim().length < 15) {
      return 'Please Enter your Complete Address';
    }
    return null;
  }

  static String? validLandmark({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your Landmark';
    }
    return null;
  }

  static String? validCity({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your City Name';
    }
    return null;
  }

  static String? validState({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your State Name';
    }
    return null;
  }

  static String? validPincode({String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter your 6 digit Pincode';
    } else if (value.length != 6) {
      return 'Please Enter your 6 digit Pincode';
    } else if (!value.isNumericOnly) {
      return 'Please Enter valid Pincode';
    }
    return null;
  }
}
