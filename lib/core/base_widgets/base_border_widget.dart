import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

class BaseBorderWidget extends BaseWidget {
  final BorderRadius? customBorderRadius;
  final double borderRadius;
  final double borderWidth;
  final Color backgroundColor;
  final Color borderColor;
  final bool strokeOnly;
  final Color strokeOnlyColor;
  final Color strokeColor;
  final Color disabledColor;
  final double? height;
  final double? width;
  final double? minWidth;
  final bool needBorder;

  const BaseBorderWidget({
    Key? key,
    this.borderRadius = 10,
    this.customBorderRadius,
    this.borderWidth = 1,
    this.backgroundColor = CommonColor.primary,
    this.borderColor = CommonColor.primary,
    this.strokeOnly = false,
    this.strokeOnlyColor = CommonColor.primary,
    this.strokeColor = CommonColor.primary,
    this.disabledColor = CommonColor.disabled,
    this.height,
    this.width,
    this.minWidth,
    this.needBorder = true,
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
    if (widget.strokeOnly) {
      return widget.strokeOnlyColor;
    }
    return widget.strokeColor;
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
          borderRadius: widget.needBorder ? _customBorderRadius : null,
          border: widget.needBorder ? Border.all(color: getBorderColor(), width: widget.borderWidth) : null,
          color: getBackgroundColor(),
        ),
        child: widget.child,
      ),
    );
  }
}
