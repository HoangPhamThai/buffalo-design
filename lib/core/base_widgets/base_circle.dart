import 'package:buffalo_design/core/base_widgets/base_border_widget.dart';
import 'package:flutter/material.dart';

class BaseCircle extends BaseBorderWidget {
  const BaseCircle({
    super.key,
    super.backgroundColor,
    this.radius = 6,
    super.borderWidth,
    super.borderColor,
    super.strokeOnly,
    super.padding,
    super.child,
  });

  final double radius;

  @override
  _BaseCircleState createState() => _BaseCircleState();
}

class _BaseCircleState extends BaseBorderWidgetState<BaseCircle> {
  @override
  Widget build(BuildContext context) {
    return BaseBorderWidget(
      padding: widget.padding,
      height: widget.radius * 2,
      width: widget.radius * 2,
      borderRadius: widget.radius,
      backgroundColor: widget.backgroundColor,
      strokeOnly: widget.strokeOnly,
      borderWidth: widget.borderWidth,
      borderColor: widget.borderColor,
      child: widget.child,
    );
  }
}
