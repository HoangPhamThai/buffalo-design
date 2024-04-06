import 'package:buffalo_design/core/base_widgets/base_border_widget.dart';
import 'package:buffalo_design/core/base_widgets/base_circle.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

class BFChip extends BaseBorderWidget {
  const BFChip(
      {super.key,
      this.suffixWidget,
      this.prefixWidget,
      super.padding,
      super.margin,
      required this.label,
      super.strokeOnly,
      super.backgroundColor,
      super.borderColor,
      super.borderRadius,
      super.borderWidth,
      super.customBorderRadius,
      super.strokeColor,
      super.needBorder,
      this.defaultPrefixColor,
      this.labelStyle});

  const BFChip.success(
      {super.key,
      this.suffixWidget,
      this.prefixWidget,
      super.padding,
      super.margin,
      required this.label,
      super.strokeOnly = false,
      super.backgroundColor = CommonColor.successBackground,
      super.borderColor,
      super.borderRadius,
      super.borderWidth,
      super.customBorderRadius,
      super.strokeColor = CommonColor.successBackground,
      super.needBorder,
      this.defaultPrefixColor = CommonColor.successContent,
      this.labelStyle = const TextStyle(fontSize: 14, color: CommonColor.successContent, fontWeight: FontWeight.w700)});

  const BFChip.warning(
      {super.key,
      this.suffixWidget,
      this.prefixWidget,
      super.padding,
      super.margin,
      required this.label,
      super.strokeOnly = false,
      super.backgroundColor = CommonColor.warningBackground,
      super.borderColor,
      super.borderRadius,
      super.borderWidth,
      super.customBorderRadius,
      super.strokeColor = CommonColor.warningBackground,
      super.needBorder,
      this.defaultPrefixColor = CommonColor.warningContent,
      this.labelStyle = const TextStyle(fontSize: 14, color: CommonColor.warningContent, fontWeight: FontWeight.w700)});

  const BFChip.disable(
      {super.key,
      this.suffixWidget,
      this.prefixWidget,
      super.padding,
      super.margin,
      required this.label,
      super.strokeOnly = false,
      super.backgroundColor = CommonColor.disableBackground,
      super.borderColor,
      super.borderRadius,
      super.borderWidth,
      super.customBorderRadius,
      super.strokeColor = CommonColor.disableBackground,
      super.needBorder,
      this.defaultPrefixColor = CommonColor.disabledContent,
      this.labelStyle = const TextStyle(fontSize: 14, color: CommonColor.disabledContent, fontWeight: FontWeight.w700)});

  /// if it's null, the default widget is a dot
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String label;
  final TextStyle? labelStyle;
  final Color? defaultPrefixColor;

  @override
  _BuffaloChipState createState() => _BuffaloChipState();
}

class _BuffaloChipState extends BaseBorderWidgetState<BFChip> {
  Widget renderPrefix() {
    return widget.prefixWidget ??
        BaseCircle(
          backgroundColor: widget.defaultPrefixColor ?? CommonColor.primary,
          strokeColor: widget.backgroundColor,
        );
  }

  Widget renderSuffix() {
    return widget.suffixWidget ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBorderWidget(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: widget.margin,
      backgroundColor: widget.backgroundColor,
      strokeColor: widget.strokeColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          renderPrefix(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.label,
              style: widget.labelStyle,
            ),
          ),
          renderSuffix(),
        ],
      ),
    );
  }
}
