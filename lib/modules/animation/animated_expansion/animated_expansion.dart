import 'package:flutter/cupertino.dart';

import 'animated_expansion_controller.dart';

class BFAnimatedExpansion extends StatefulWidget {
  final Widget child;
  final BFAnimatedExpansionController controller;

  const BFAnimatedExpansion({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  _BFAnimatedExpansionState createState() => _BFAnimatedExpansionState();
}

class _BFAnimatedExpansionState extends State<BFAnimatedExpansion> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  void prepareAnimations() {
    expandController = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.controller.isExpand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(BFAnimatedExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: widget.controller.getNotifier,
        builder: (context, value, child) {
          _runExpandCheck();
          return SizeTransition(axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
        });
  }
}
