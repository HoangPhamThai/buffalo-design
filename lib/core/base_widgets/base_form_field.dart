import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BaseFormField<T> extends BaseWidget {
  const BaseFormField({
    super.key,
    this.value,
    this.validator,
    this.isRequired = false,
    super.status,
    super.child,
    super.padding,
    super.margin,
    this.helpText,
  });

  final bool isRequired;
  final Function? validator;
  final T? value;
  final String? helpText;

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
