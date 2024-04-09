import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

class BaseBorderWidget extends BaseWidget {
  /// customize the border, e.g. only have border in the top corners
  /// only work when [needBorder] is true
  final BorderRadius? customBorderRadius;

  /// the border's radius
  /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
  final double borderRadius;

  /// the border's width
  /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
  final double borderWidth;

  /// background color of the button
  /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
  final Color backgroundColor;

  /// the border's color
  /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
  ///  if empty, the border and background will have the same color
  final Color? borderColor;

  /// the color of button when [status] is disable
  final Color disabledColor;
  final double? height;
  final double? width;
  final double? minWidth;
  final bool strokeOnly;

  const BaseBorderWidget({
    Key? key,
    this.borderRadius = 10,
    this.customBorderRadius,
    this.borderWidth = 1,
    this.backgroundColor = CommonColor.primary,
    this.borderColor,
    this.disabledColor = CommonColor.disabled,
    this.height,
    this.width,
    this.minWidth,
    this.strokeOnly = false,
    super.margin,
    super.padding,
    super.status,
    super.child,
  }) : super(key: key);

  @override
  BaseBorderWidgetState createState() {
    return BaseBorderWidgetState();
  }
}

class BaseBorderWidgetState<T extends BaseBorderWidget> extends BaseWidgetState<T> {
  late final BorderRadius _customBorderRadius;

  @override
  void initState() {
    super.initState();
    _customBorderRadius = widget.customBorderRadius ?? BorderRadius.circular(widget.borderRadius);
  }

  Color getBorderColor() {
    if (widget.status == WidgetStatus.disable) {
      return widget.disabledColor;
    }
    return widget.borderColor ?? widget.backgroundColor;
  }

  Color getBackgroundColor() {
    if (widget.status == WidgetStatus.disable) {
      return CommonColor.disableBackground;
    }
    if (widget.strokeOnly) {
      return Colors.white;
    }
    return widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        height: widget.height,
        width: widget.width,
        constraints: widget.minWidth == null
            ? null
            : BoxConstraints(
                minWidth: widget.minWidth!,
              ),
        decoration: BoxDecoration(
          borderRadius: _customBorderRadius,
          border: Border.all(color: getBorderColor(), width: widget.borderWidth),
          color: getBackgroundColor(),
        ),
        child: widget.child,
      ),
    );
  }
}
