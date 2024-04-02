import 'package:buffalo_design/core/base_widgets/base_border_widget.dart';
import 'package:flutter/material.dart';

class BaseCircle extends BaseBorderWidget {
  const BaseCircle({
    super.key,
    super.backgroundColor,
    this.radius = 12,
    super.borderWidth,
    super.borderColor,
    super.strokeOnly,
    super.strokeColor,
  });

  final double radius;

  @override
  _BaseCircleState createState() => _BaseCircleState();
}

class _BaseCircleState extends BaseBorderWidgetState<BaseCircle> {
  @override
  Widget build(BuildContext context) {
    return BaseBorderWidget(
      height: widget.radius,
      width: widget.radius,
      borderRadius: widget.radius,
      strokeColor: widget.strokeColor,
      backgroundColor: widget.backgroundColor,
      strokeOnly: widget.strokeOnly,
      borderWidth: widget.borderWidth,
      borderColor: widget.borderColor,
    );
  }
}
