import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design/modules/timeline/_time_line_vertical.dart';
import 'package:buffalo_design/modules/timeline/entities/time_line_entity.dart';
import 'package:flutter/material.dart';

import '_time_line_horizontal.dart';

enum DisplayMode { opposite, same }

class BFTimeLine extends BaseWidget {
  BFTimeLine({
    super.key,
    this.currentPosition = 0,
    this.direction = Axis.horizontal,
    this.displayMode = DisplayMode.opposite,
    required this.items,
    this.customPastLine,
    this.customFutureLine,
    this.lineLength = 50,
    this.spaceBetween = 20,
    super.padding,
    super.margin,
  })  : assert(items.isNotEmpty),
        assert(currentPosition < items.length);

  final int currentPosition;
  final Axis direction;
  final DisplayMode displayMode;
  final List<TimeLineEntity> items;
  final Widget? customPastLine;
  final Widget? customFutureLine;
  final double lineLength;
  final double spaceBetween;

  @override
  _BFTimeLineState createState() => _BFTimeLineState();
}

class _BFTimeLineState extends BaseWidgetState<BFTimeLine> {
  @override
  Widget build(BuildContext context) {
    if (widget.direction == Axis.horizontal) {
      return TimeLineHorizontalWidget(
        items: widget.items,
        currentPosition: widget.currentPosition,
        titlePosition: widget.displayMode,
        customFutureLine: widget.customFutureLine,
        customPastLine: widget.customPastLine,
        lineLength: widget.lineLength,
        padding: widget.padding,
        margin: widget.margin,
        spaceBetween: widget.spaceBetween,
      );
    }
    return TimeLineVerticalWidget(
      items: widget.items,
      currentPosition: widget.currentPosition,
      titlePosition: widget.displayMode,
      customFutureLine: widget.customFutureLine,
      customPastLine: widget.customPastLine,
      lineLength: widget.lineLength,
      padding: widget.padding,
      margin: widget.margin,
      spaceBetween: widget.spaceBetween,
    );
  }
}
