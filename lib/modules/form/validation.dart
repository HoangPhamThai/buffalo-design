import 'package:buffalo_design/core/constants/constants.dart';

class BFFormValidation {
  static String? validateEmpty({String? value, String? message, bool mandatory = true}) {
    value ??= '';
    if (value.isEmpty && mandatory) {
      return message ?? messageWarningEmpty;
    }
    return null;
  }

  static String? validateDropdown<T>({required T? value, String? message, bool mandatory = false}) {
    if (value == null && mandatory) {
      return message ?? messageMustSelect;
    }
    return null;
  }
}
