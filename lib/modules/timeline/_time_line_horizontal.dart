import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../core/base_widgets/base_circle.dart';
import '../../core/base_widgets/base_widget.dart';
import '../../core/styles/colors.dart';
import 'entities/time_line_entity.dart';
import 'time_line_widget.dart';

class TimeLineHorizontalWidget extends BaseWidget {
  TimeLineHorizontalWidget({
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
  _TimeLineHorizontalWidgetState createState() => _TimeLineHorizontalWidgetState();
}

class _TimeLineHorizontalWidgetState extends BaseWidgetState<TimeLineHorizontalWidget> {
  AutoScrollController scrollController = AutoScrollController(viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0));
  final double defaultLineHeight = 2;

  late final Widget defaultBlankLine;

  @override
  void initState() {
    super.initState();
    defaultBlankLine = SizedBox(width: widget.lineLength);
    scrollController.scrollToIndex(widget.currentPosition, preferPosition: AutoScrollPosition.middle);
  }

  CrossAxisAlignment getAlignmentTitle() {
    if (widget.titlePosition == DisplayMode.opposite) {
      return CrossAxisAlignment.end;
    }
    return CrossAxisAlignment.start;
  }

  Widget renderTitle(MapEntry<int, TimeLineEntity> item) {
    return SizedBox(
      width: 2 * widget.lineLength,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.spaceBetween / 2),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Builder(builder: (context) {
              if (item.value.customTitle != null) {
                return item.value.customTitle!;
              }
              if (item.value.title == null) {
                return Container();
              }
              return Text(
                item.value.title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget renderPoint(MapEntry<int, TimeLineEntity> item) {
    return Container(
        height: 20,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// Progress line on the left
                Builder(builder: (context) {
                  if (item.key == 0) {
                    return defaultBlankLine;
                  }
                  if (item.key <= widget.currentPosition) {
                    return widget.customPastLine ??
                        Container(
                          height: defaultLineHeight,
                          width: widget.lineLength,
                          color: CommonColor.greenLine,
                        );
                  }
                  return widget.customFutureLine ??
                      Container(
                        height: defaultLineHeight,
                        width: widget.lineLength,
                        color: CommonColor.greyLine,
                      );
                }),

                /// Progress line on the right
                Builder(builder: (context) {
                  if (item.key == widget.items.length - 1) {
                    return defaultBlankLine;
                  }
                  if (item.key >= widget.currentPosition) {
                    return widget.customPastLine ??
                        Container(
                          height: defaultLineHeight,
                          width: widget.lineLength,
                          color: CommonColor.greyLine,
                        );
                  }
                  return widget.customFutureLine ??
                      Container(
                        height: defaultLineHeight,
                        width: widget.lineLength,
                        color: CommonColor.greenLine,
                      );
                }),
              ],
            ),

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
          ],
        ));
  }

  Widget renderDescription(MapEntry<int, TimeLineEntity> item) {
    return SizedBox(
        width: 2 * widget.lineLength,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.spaceBetween / 2),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Builder(builder: (context) {
                if (item.value.customDescription != null) {
                  return item.value.customDescription!;
                }
                if (item.value.description == null) {
                  return Container();
                }
                return Text(
                  item.value.description!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                );
              }),
            ],
          ),
        ));
  }

  Widget renderListTitle() {
    return Row(
        crossAxisAlignment: getAlignmentTitle(),
        children: widget.items.asMap().entries.map((e) {
          return AutoScrollTag(
            controller: scrollController,
            key: ValueKey(e.key),
            index: e.key,
            child: renderTitle(e),
          );
        }).toList());
  }

  Widget renderListPoint() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items.asMap().entries.map((e) {
          return renderPoint(e);
        }).toList());
  }

  Widget renderListDescription() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items.asMap().entries.map((e) {
          return renderDescription(e);
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        child: Column(
          children: [
            if (widget.titlePosition == DisplayMode.opposite) ...[
              renderListTitle(),
              renderListPoint(),
            ] else ...[
              renderListPoint(),
              renderListTitle(),
            ],
            renderListDescription(),
          ],
        ),
      ),
    );
  }
}
