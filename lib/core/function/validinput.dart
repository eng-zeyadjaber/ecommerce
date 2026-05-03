import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if (value.isEmpty) {
    return "field_required".tr;
  }

  if (value.length < min) {
    return "min_length".trParams({"min": "$min"});
  }

  if (value.length > max) {
    return "max_length".trParams({"max": "$max"});
  }

  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "invalid_email".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "invalid_phone".tr;
    }
  }

  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "invalid_username".tr;
    }
  }

  if (type == "password") {
    if (value.length < 6) {
      return "weak_password".tr;
    }
  }

  return null;
}
