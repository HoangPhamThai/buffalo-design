import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

import 'menu_item.dart';

class BFMenuTitle extends BaseWidget {
  const BFMenuTitle({
    super.key,
    required this.title,
    this.children = const [],
    this.backgroundColor,
    this.borderRadius = 10,
    super.margin,
  });
  final Widget title;
  final List<BFMenuItem> children;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  _MenuTitleState createState() => _MenuTitleState();
}

class _MenuTitleState extends BaseWidgetState<BFMenuTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: widget.title,
          childrenPadding: const EdgeInsets.only(left: 10),
          children: widget.children,
        ),
      ),
    );
  }
}
