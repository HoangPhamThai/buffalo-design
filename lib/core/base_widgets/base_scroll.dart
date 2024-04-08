import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BaseScrollWidget extends BaseWidget {
  const BaseScrollWidget({
    super.key,
    required this.children,
    this.direction = Axis.vertical,
    this.itemPerRow,
    this.verticalSpacing,
    this.horizontalSpacing,
    this.physics,
  });

  final ScrollPhysics? physics;
  final double? horizontalSpacing;
  final double? verticalSpacing;
  final double? itemPerRow;
  final Axis direction;
  final List<Widget> children;

  @override
  _BaseScrollWidgetState createState() => _BaseScrollWidgetState();
}

class _BaseScrollWidgetState extends BaseWidgetState<BaseScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
