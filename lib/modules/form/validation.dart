import 'package:buffalo_design/core/constants/constants.dart';

class FormValidation {
  static String? validateEmpty({String? value, String? message, bool mandatory = true}) {
    value ??= '';
    if (value.isEmpty && mandatory) {
      return message ?? messageWarningEmpty;
    }
    return null;
  }
}