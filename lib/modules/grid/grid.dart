import 'package:buffalo_design/core/base_widgets/base_list.dart';
import 'package:flutter/material.dart';

class BFGrid extends BaseListWidget {
  const BFGrid({
    super.key,
    super.margin,
    super.padding,
    required super.children,
    required this.horizontalSpacing,
    required this.verticalSpacing,
    required this.itemPerRow,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double itemPerRow;

  @override
  _BFGridState createState() => _BFGridState();
}

class _BFGridState extends BaseListWidgetState<BFGrid> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
  }
}
