import 'package:buffalo_design/core/base_widgets/base_list.dart';
import 'package:flutter/material.dart';

class BFColumn extends BaseListWidget {
  const BFColumn({
    super.key,
    super.margin,
    super.padding,

    /// Spacing between 2 consecutive items
    super.spacing = 10,
    super.customSeparator,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.mainAxisAlignment = MainAxisAlignment.center,
    super.mainAxisSize = MainAxisSize.min,

    /// if set to true, it will render Divider with vertical padding of [spacing] / 2
    super.withDefaultDivider,
    required super.children,
  });

  @override
  _BFColumnState createState() => _BFColumnState();
}

class _BFColumnState extends BaseListWidgetState<BFColumn> {
  @override
  Widget build(BuildContext context) {
    return BaseListWidget(
      margin: widget.margin,
      padding: widget.padding,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      direction: Axis.vertical,
      spacing: widget.spacing,
      withDefaultDivider: widget.withDefaultDivider,
      customSeparator: widget.customSeparator,
      children: widget.children,
    );
  }
}
