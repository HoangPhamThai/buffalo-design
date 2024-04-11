import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BaseFormField extends BaseWidget {
  const BaseFormField({
    super.key,
    this.initValue,
    this.validator,
    this.isRequired = false,
    required this.name,
    super.status,
    super.child,
    super.padding,
    super.margin,
  });

  final bool isRequired;
  final Function? validator;
  final dynamic initValue;
  final String name;

  @override
  BaseFormFieldState createState() => BaseFormFieldState();
}

class BaseFormFieldState<T extends BaseFormField> extends BaseWidgetState<T> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      margin: widget.margin,
      padding: widget.padding,
      status: widget.status,
      child: widget.child,
    );
  }
}
