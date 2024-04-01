import 'package:flutter/material.dart';

class BaseInputMixin<T> {
  final bool isRequired;
  final Function? validator;
  final T? initValue;
  final String? label;
  final EdgeInsets? labelMargin;

  BaseInputMixin({
    this.initValue,
    this.isRequired = false,
    this.label,
    this.validator,
    this.labelMargin,
  });
}
