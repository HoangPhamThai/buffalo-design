import 'package:buffalo_design/core/base_widgets/base_form_field.dart';
import 'package:buffalo_design/core/base_widgets/base_label.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

import '../validation.dart';

class BFDropdownButtonField<T> extends BaseFormField {
  final String? label;
  final String? disabledHint;
  final Widget? disabledHintWidget;

  final AutovalidateMode autoValidateMode;
  final Function(dynamic) onChanged;
  final List<DropdownMenuItem<T>> items;
  final String? hintText;
  final Widget? hintWidget;
  final FormFieldSetter<T>? onSaved;
  final Color? shapeColor;
  final Axis layoutMode;
  final VoidCallback? onRemove;
  final Color? arrowIconColor;
  final TextStyle? labelStyle;
  final bool hasColon;
  final int? maxDisplayItem;

  const BFDropdownButtonField({
    Key? key,
    required this.items,
    this.label,
    this.disabledHint,
    required this.onChanged,
    super.isRequired,
    super.validator,
    required super.value,
    super.margin,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.disabledHintWidget,
    this.hintWidget,
    this.onSaved,
    this.shapeColor,
    this.hasColon = false,
    this.layoutMode = Axis.vertical,
    this.onRemove,
    this.arrowIconColor,
    this.labelStyle,
    this.maxDisplayItem,
    super.helpText,
  })  : assert(maxDisplayItem != 0),
        super(key: key);

  @override
  _BFDropdownButtonFieldState<T> createState() => _BFDropdownButtonFieldState<T>();
}

class _BFDropdownButtonFieldState<T> extends BaseFormFieldState<BFDropdownButtonField<T>> {
  T? value;

  final double defaultItemHeight = 54;
  final double defaultIconHeight = 24;

  final OutlineInputBorder borderDropdownFormField = const OutlineInputBorder(
    borderSide: BorderSide(
      color: CommonColor.borderGrey,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  @override
  void initState() {
    super.initState();

    checkValidInput();
  }

  @override
  void didUpdateWidget(covariant BFDropdownButtonField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkValidInput();
  }

  FormFieldValidator<T>? getValidator() {
    if (widget.validator != null) {
      return (value) => widget.validator?.call(value);
    }
    return (value) => BFFormValidation.validateDropdown(value: value, mandatory: widget.isRequired, message: widget.helpText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Builder(builder: (context) {
        if (widget.layoutMode == Axis.horizontal) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.label != null) ...[
                _buildLabel(),
                const SizedBox(
                  width: 20,
                ),
              ],
              Expanded(child: _buildDropDown()),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              _buildLabel(),
            ],
            _buildDropDown(margin: widget.label != null ? const EdgeInsets.only(top: 10) : EdgeInsets.zero),
          ],
        );
      }),
    );
  }

  void checkValidInput() {
    value = widget.value;
    if (value != null) {
      List data = widget.items.map((e) => e.value).toList();
      try {
        data.firstWhere((element) => element == value);
      } catch (e) {
        value = null;
      }
    }
  }

  Widget _buildLabel() {
    return BaseLabel(
      label: widget.label!,
      hasColon: widget.hasColon,
      isRequired: widget.isRequired,
    );
  }

  Widget _buildDropDown({EdgeInsets margin = EdgeInsets.zero}) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          DropdownButtonFormField<T>(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onSaved: widget.onSaved,
            autovalidateMode: widget.autoValidateMode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: borderDropdownFormField,
              focusedBorder: borderDropdownFormField,
              border: borderDropdownFormField,
              filled: true,
              fillColor: Colors.white,
            ),
            validator: getValidator(),
            isExpanded: true,
            value: value,
            disabledHint: widget.disabledHintWidget ?? Text(widget.disabledHint ?? ''),
            hint: widget.hintWidget ?? Text(widget.hintText ?? '---'),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: widget.arrowIconColor,
            ),
            iconSize: defaultIconHeight,
            onChanged: (T? value) => widget.onChanged(value),
            items: widget.items,
            menuMaxHeight: widget.maxDisplayItem == null ? null : widget.maxDisplayItem! * defaultItemHeight,
          ),
          if (value != null && !widget.isRequired && widget.onRemove != null) ...[
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  widget.onRemove!.call();
                  setState(() {
                    value = null;
                  });
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
