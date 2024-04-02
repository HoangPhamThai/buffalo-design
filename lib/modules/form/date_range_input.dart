import 'package:buffalo_design/core/base_widgets/base_border_widget.dart';
import 'package:buffalo_design/utils/utils.dart';
import 'package:flutter/material.dart';

class BFDateRangeInput extends BaseBorderWidget {
  final Widget? customFromDate;
  final Widget? customToDate;
  final String fromDateLabel;
  final String toDateLabel;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? currentDate;
  final bool hasContentPadding;
  final Widget? arrowIcon;
  final Locale? locale;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final String? saveText;
  final String formatDateTime;
  final String? initStartDate;
  final String? initEndDate;

  const BFDateRangeInput({
    super.key,
    required this.fromDateLabel,
    required this.toDateLabel,
    this.customFromDate,
    this.customToDate,
    this.prefixWidget,
    this.suffixWidget,
    this.endDate,
    this.startDate,
    this.initStartDate,
    this.initEndDate,
    this.locale,
    this.currentDate,
    super.strokeOnly,
    super.strokeOnlyColor,
    super.strokeColor,
    super.backgroundColor,
    super.needBorder,
    super.status,
    super.padding,
    super.margin,
    super.width,
    this.hasContentPadding = true,
    this.arrowIcon,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.saveText,
    this.formatDateTime = 'dd-MM-yyyy',
  });

  @override
  _DateRangeInputState createState() => _DateRangeInputState();
}

class _DateRangeInputState extends BaseBorderWidgetState<BFDateRangeInput> {
  late Widget fromDateWidget;
  late Widget toDateWidget;

  @override
  void initState() {
    super.initState();
    fromDateWidget = widget.customFromDate ?? Text(widget.fromDateLabel);
    toDateWidget = widget.customToDate ?? Text(widget.toDateLabel);
  }

  Widget renderPrefixWidget() {
    return widget.prefixWidget ?? Container();
  }

  Widget renderSuffixWidget() {
    return widget.suffixWidget ??
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: const Icon(Icons.calendar_month),
        );
  }

  Widget renderDateRangeWidget() {
    return Row(
      children: [
        fromDateWidget,
        widget.arrowIcon ??
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Icon(Icons.arrow_forward),
            ),
        toDateWidget,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBorderWidget(
      padding: widget.hasContentPadding ? widget.padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 14) : EdgeInsets.zero,
      margin: widget.margin,
      customBorderRadius: widget.customBorderRadius,
      borderRadius: widget.borderRadius,
      borderWidth: widget.borderWidth,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      strokeOnly: widget.strokeOnly,
      status: widget.status,
      strokeColor: widget.strokeColor,
      strokeOnlyColor: widget.strokeOnlyColor,
      disabledColor: widget.disabledColor,
      height: widget.height,
      width: widget.width,
      minWidth: widget.minWidth,
      needBorder: widget.needBorder,
      child: GestureDetector(
        onTap: () {
          showDateRangePicker(
            context: context,
            firstDate: widget.startDate ?? DateTime.now(),
            lastDate: widget.endDate ??
                DateTime.now().add(
                  const Duration(days: 30),
                ),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            locale: widget.locale,
            cancelText: widget.cancelText,
            confirmText: widget.confirmText,
            helpText: widget.helpText,
            saveText: widget.saveText,
            currentDate: widget.currentDate,
          ).then((value) {
            print(value);
            if (value != null) {
              setState(() {
                fromDateWidget = Text(formatDateTime(date: value.start, format: widget.formatDateTime));
                toDateWidget = Text(formatDateTime(date: value.end, format: widget.formatDateTime));
              });
            }
          });
        },
        child: Row(
          children: [
            renderPrefixWidget(),
            renderDateRangeWidget(),
            renderSuffixWidget(),
          ],
        ),
      ),
    );
  }
}
