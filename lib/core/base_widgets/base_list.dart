import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BaseListWidget extends BaseWidget {
  const BaseListWidget({
    super.key,
    super.margin,
    super.padding,
    this.customSeparator,
    this.spacing = 10,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.withDefaultDivider = false,
    this.direction = Axis.vertical,
    required this.children,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Widget? customSeparator;

  /// Spacing between 2 consecutive items
  final double spacing;

  /// if set to true, based on [direction], it will render Divider/VerticalDivider with vertical/horizontal padding of [spacing] / 2
  final bool withDefaultDivider;

  final Axis direction;
  final List<Widget> children;

  @override
  BaseListWidgetState createState() => BaseListWidgetState();
}

class BaseListWidgetState<T extends BaseListWidget> extends BaseWidgetState<BaseListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget renderDivider() {
    if (widget.direction == Axis.vertical) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: widget.spacing / 2),
        child: const Divider(),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
      child: const VerticalDivider(),
    );
  }

  Widget renderGap() {
    if (widget.direction == Axis.vertical) {
      return SizedBox(
        height: widget.spacing,
      );
    }
    return SizedBox(
      width: widget.spacing,
    );
  }

  Widget renderSeparator() {
    if (widget.customSeparator != null) {
      return widget.customSeparator!;
    }
    if (widget.withDefaultDivider) {
      return renderDivider();
    }
    return renderGap();
  }

  List<Widget> renderListWidget() {
    if (widget.direction == Axis.vertical) {
      return widget.children.asMap().entries.map((e) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            e.value,
            if (e.key != (widget.children.length - 1)) ...[renderSeparator()],
          ],
        );
      }).toList();
    }
    return widget.children.asMap().entries.map((e) {
      return IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            e.value,
            if (e.key != (widget.children.length - 1)) ...[renderSeparator()],
          ],
        ),
      );
    }).toList();
  }

  Widget renderChild() {
    if (widget.direction == Axis.vertical) {
      return Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        children: renderListWidget(),
      );
    }
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      children: renderListWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      alignment: Alignment.center,
      child: renderChild(),
    );
  }
}
