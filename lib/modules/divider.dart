import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

enum Position { left, right, middle, none }

class BFDivider extends BaseWidget {
  final Position orientation;
  final Widget? child;
  final double? thickness;
  final double? height;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final double spaceToBorder;

  const BFDivider({
    super.key,
    this.orientation = Position.none,
    this.child,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.spaceToBorder = 50,
  });

  @override
  _BuffaloDividerState createState() => _BuffaloDividerState();
}

class _BuffaloDividerState extends BaseWidgetState<BFDivider> {
  late final Widget defaultDivider;
  late final Widget defaultExpandedDivider;

  Widget renderDividerWithChild() {
    switch (widget.orientation) {
      case Position.left:
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: widget.spaceToBorder,
              child: defaultDivider,
            ),
            widget.child!,
            defaultExpandedDivider,
          ],
        );
      case Position.right:
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            defaultExpandedDivider,
            widget.child!,
            SizedBox(
              width: widget.spaceToBorder,
              child: defaultDivider,
            ),
          ],
        );
      case Position.middle:
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            defaultExpandedDivider,
            widget.child!,
            defaultExpandedDivider,
          ],
        );
      case Position.none:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    defaultDivider = Divider(
      height: widget.height,
      thickness: widget.thickness,
      indent: widget.indent,
      endIndent: widget.endIndent,
      color: widget.color,
    );
    defaultExpandedDivider = Expanded(
      child: defaultDivider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: widget.child != null ? renderDividerWithChild() : defaultDivider,
    );
  }
}
