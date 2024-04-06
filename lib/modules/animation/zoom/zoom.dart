import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BFZoomAnimation extends BaseWidget {
  const BFZoomAnimation({
    super.key,
    required super.child,
    this.duration,
    this.start = 1,
    required this.zoomFactor,
    this.repeat = true,
    this.reverse = true,
    this.curve = Curves.linearToEaseOut,
    super.status,
  });
  final Duration? duration;
  final double start;
  final double zoomFactor;
  final bool repeat;
  final bool reverse;
  final Curve curve;

  @override
  _BFZoomAnimationState createState() => _BFZoomAnimationState();
}

class _BFZoomAnimationState extends BaseWidgetState<BFZoomAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    if (widget.repeat) {
      _controller.repeat(reverse: widget.reverse);
    } else {
      _controller.forward();
    }
    _animation = Tween<double>(begin: widget.start, end: widget.zoomFactor).animate(_controller)..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == WidgetStatus.enable) {
      return AnimatedContainer(
        duration: widget.duration ?? const Duration(milliseconds: 300),
        curve: widget.curve,
        transform: Matrix4.identity()..scale(_animation.value),
        child: widget.child,
      );
    }
    return widget.child!;
  }
}
