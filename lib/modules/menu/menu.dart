import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

import 'menu_title.dart';

class BFMenu extends BaseWidget {
  const BFMenu({
    super.key,
    super.margin,
    super.padding,
    this.width,
    this.children = const [],
  });

  final double? width;
  final List<BFMenuTitle> children;

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends BaseWidgetState<BFMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: widget.margin,
      padding: widget.padding,
      child: Column(
        children: widget.children,
      ),
    );
  }
}
