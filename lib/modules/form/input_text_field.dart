import 'package:buffalo_design/core/base_widgets/base_form_field.dart';
import 'package:buffalo_design/core/base_widgets/base_label.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BFInputTextField extends BaseFormField {
  final String? label;
  final String? labelFloating;
  final String? hint;
  final TextEditingController? controller;
  final bool required;
  final String? explain;
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

  const BFInputTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.required = false,
    this.explain,
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
    this.textStyle = const TextStyle(color: Colors.black),
    this.labelFontSize,
    this.labelStyle,
    required super.name,
    super.isRequired,
    super.validator,
    super.initValue,
    super.status,
  })  : assert(minLines <= maxLines),
        super(key: key);

  @override
  _BFInputTextFieldState createState() => _BFInputTextFieldState();
}

class _BFInputTextFieldState extends BaseFormFieldState<BFInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.axis == Axis.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildLabel(widget.labelMargin),
                _buildInputField(),
              ],
            )
          : widget.expandTextField
              ? _buildInputField()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: widget.labelHorizontalFlex, child: _buildLabel(EdgeInsets.zero)),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(flex: 3, child: _buildInputField()),
                  ],
                ),
    );
  }

  Widget _buildLabel(EdgeInsets margin) {
    if (widget.label == null) return Container();
    return BaseLabel(
      label: widget.label!,
      isRequired: widget.required,
      margin: margin,
      style: widget.labelStyle,
    );
  }

  Widget _buildInputField() {
    return TextFormField(
      style: widget.textStyle,
      readOnly: widget.isReadOnly,
      controller: widget.controller,
      autofocus: widget.autofocus,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      scrollPadding: widget.scrollPadding,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor ?? Colors.white,
        filled: true,
        contentPadding: widget.contentPadding ?? const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
        labelText: widget.labelFloating,
        focusedBorder: widget.isReadOnly
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
        hintText: widget.hint,
        enabledBorder: widget.enableBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: widget.borderColor ?? CommonColor.borderGrey),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
        border: widget.border ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: widget.borderColor ?? CommonColor.borderGrey),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
      obscureText: widget.shouldObscure,
      validator: (value) => widget.validator?.call(value),
      onTap: widget.onTap,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
    );
  }
}
