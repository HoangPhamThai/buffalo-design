import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../core/base_widgets/base_circle.dart';
import '../../core/base_widgets/base_widget.dart';
import '../../core/styles/colors.dart';
import 'entities/time_line_entity.dart';
import 'time_line_widget.dart';

class TimeLineVerticalWidget extends BaseWidget {
  TimeLineVerticalWidget({
    super.key,
    this.currentPosition = 0,
    this.titlePosition = DisplayMode.opposite,
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
  final DisplayMode titlePosition;
  final List<TimeLineEntity> items;
  final Widget? customPastLine;
  final Widget? customFutureLine;
  final double lineLength;
  final double spaceBetween;

  @override
  _TimeLineVerticalWidgetState createState() => _TimeLineVerticalWidgetState();
}

class _TimeLineVerticalWidgetState extends BaseWidgetState<TimeLineVerticalWidget> {
  AutoScrollController scrollController = AutoScrollController(viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0));
  final double defaultLineWidth = 2;
  final double defaultPadding = 5;

  Widget renderRow(MapEntry<int, TimeLineEntity> item) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 30,
            margin: EdgeInsets.only(top: item.key == 0 ? defaultPadding : 0),
            child: Column(
              children: [
                /// Top line
                if (item.key != 0) ...[
                  Container(
                    width: defaultLineWidth,
                    height: defaultPadding,
                    color: Colors.blue,
                  ),
                ],

                /// Circle
                Builder(builder: (context) {
                  if (item.value.customDot != null) {
                    return item.value.customDot!;
                  }
                  if (item.key < widget.currentPosition) {
                    return const BaseCircle(
                      radius: 8,
                      backgroundColor: CommonColor.greenLine,
                    );
                  }
                  if (item.key == widget.currentPosition) {
                    return const BaseCircle(
                      radius: 12,
                      backgroundColor: CommonColor.warningContent,
                    );
                  }
                  return const BaseCircle(
                    radius: 8,
                    backgroundColor: CommonColor.greyLine,
                  );
                }),

                /// Bottom line
                if (item.key != (widget.items.length - 1)) ...[
                  Expanded(
                      child: Container(
                    width: defaultLineWidth,
                    color: Colors.blue,
                  )),
                ],
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: widget.spaceBetween),
            child: Column(
              children: [
                item.value.customTitle ?? Text(item.value.title ?? ""),
                item.value.customDescription ?? Text(item.value.description ?? ""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        child: Column(
          children: widget.items.asMap().entries.map((e) {
            return renderRow(e);
          }).toList(),
        ),
      ),
    );
  }
}
