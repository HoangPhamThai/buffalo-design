import 'package:flutter/material.dart';

enum WidgetStatus { enable, disable }

class BaseWidget extends StatefulWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final WidgetStatus status;
  final Widget? child;

  const BaseWidget({
    Key? key,
    this.padding,
    this.margin,
    this.status = WidgetStatus.enable,
    this.child,
  }) : super(key: key);

  @override
  BaseWidgetState createState() {
    return BaseWidgetState();
  }
}

class BaseWidgetState<T extends BaseWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.status == WidgetStatus.disable,
      child: widget.child,
    );
  }
}
