import 'package:buffalo_design/core/base_widgets/base_list.dart';
import 'package:flutter/material.dart';

class BFRow extends BaseListWidget {
  const BFRow({
    super.key,
    super.margin,
    super.padding,
    super.customSeparator,

    /// Spacing between 2 consecutive items
    super.spacing = 10,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.mainAxisAlignment = MainAxisAlignment.center,
    super.mainAxisSize = MainAxisSize.min,

    /// if set to true, it will render VerticalDivider with horizontal padding of [spacing] / 2
    super.withDefaultDivider,
    required super.children,
  });

  @override
  _BFRowState createState() => _BFRowState();
}

class _BFRowState extends BaseListWidgetState<BFRow> {
  @override
  Widget build(BuildContext context) {
    return BaseListWidget(
      margin: widget.margin,
      padding: widget.padding,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      direction: Axis.horizontal,
      spacing: widget.spacing,
      withDefaultDivider: widget.withDefaultDivider,
      customSeparator: widget.customSeparator,
      children: widget.children,
    );
  }
}
