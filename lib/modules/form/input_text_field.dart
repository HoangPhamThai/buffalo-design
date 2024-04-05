import 'package:buffalo_design/core/base_widgets/base_label.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  final String? label;
  final String? labelFloating;
  final String? hint;
  final TextEditingController? controller;
  final bool required;
  final String? explain;
  final Function? validator;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final EdgeInsets scrollPadding;
  final EdgeInsets labelMargin;
  final bool autofocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Axis axis;
  final int minLines;
  final bool expandTextField;
  final bool shouldObscure;
  final EdgeInsets? contentPadding;
  final GestureTapCallback? onTap;
  final InputBorder? enableBorder;
  final InputBorder? border;
  final bool isReadOnly;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final String? initialValue;
  final int labelHorizontalFlex;
  final int maxLines;
  final TextStyle? textStyle;
  final double? labelFontSize;
  final TextStyle? labelStyle;

  InputTextField({
    Key? key,
    this.label,
    this.hint = '',
    this.controller,
    this.required = false,
    this.explain,
    this.validator,
    this.initialValue,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const [],
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.scrollPadding = const EdgeInsets.all(20),
    this.labelMargin = const EdgeInsets.only(top: 20, bottom: 10),
    this.autofocus = false,
    this.suffixIcon,
    this.axis = Axis.vertical,
    this.minLines = 1,
    this.maxLines = 1,
    this.labelFloating,
    this.expandTextField = false,
    this.prefixIcon,
    this.shouldObscure = false,
    this.contentPadding,
    this.onTap,
    this.enableBorder,
    this.border,
    this.isReadOnly = false,
    this.fillColor,
    this.borderColor,
    this.hintStyle,
    this.labelHorizontalFlex = 1,
    this.textStyle,
    this.labelFontSize,
    this.labelStyle,
  })  : assert(minLines <= maxLines),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: axis == Axis.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildLabel(labelMargin),
                _buildInputField(),
              ],
            )
          : expandTextField
              ? _buildInputField()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: labelHorizontalFlex, child: _buildLabel(EdgeInsets.zero)),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(flex: 3, child: _buildInputField()),
                  ],
                ),
    );
  }

  Widget _buildLabel(EdgeInsets margin) {
    if (label == null) return Container();
    return BaseLabel(
      label: label!,
      isRequired: required,
      margin: margin,
      style: labelStyle,
    );
  }

  Widget _buildInputField() {
    return TextFormField(
      style: textStyle,
      readOnly: isReadOnly,
      controller: controller,
      autofocus: autofocus,
      onSaved: onSaved,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      scrollPadding: scrollPadding,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        fillColor: fillColor ?? Colors.white,
        filled: true,
        contentPadding: contentPadding ?? const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
        labelText: labelFloating,
        focusedBorder: isReadOnly
            ? const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: CommonColor.borderGrey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              )
            : const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: CommonColor.primary,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
        hintText: hint,
        enabledBorder: enableBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor ?? CommonColor.borderGrey),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor ?? CommonColor.borderGrey),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      obscureText: shouldObscure,
      validator: (value) => validator?.call(value),
      onTap: onTap,
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
