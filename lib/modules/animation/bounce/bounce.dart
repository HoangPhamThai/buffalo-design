import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BFBounceAnimation extends BaseWidget {
  const BFBounceAnimation({
    super.key,
    required super.child,
    this.repeat = true,
    this.reverse = true,
    this.curve = Curves.linearToEaseOut,
    this.duration,
    this.bounceHeight = 30,
    super.status,
  });

  final Duration? duration;
  final bool repeat;
  final bool reverse;
  final Curve curve;
  final double bounceHeight;

  @override
  _BFBounceState createState() => _BFBounceState();
}

class _BFBounceState extends BaseWidgetState<BFBounceAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0, end: widget.bounceHeight).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );

    if (widget.repeat) {
      _controller.repeat(reverse: widget.reverse);
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == WidgetStatus.enable) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(offset: Offset(0.0, -_animation.value), child: widget.child);
        },
      );
    }
    return widget.child!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
