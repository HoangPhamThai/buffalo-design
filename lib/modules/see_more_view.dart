import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

class BFSeeMoreView extends BaseWidget {
  final double initHeight;
  final bool triggerSeeMore;
  final Widget? seeMoreWidget;
  final Widget? seeLessWidget;
  final String? seeMoreLabel;
  final String? seeLessLabel;
  final double bottomOffset;
  final double gradientRatio;
  final Duration duration;

  const BFSeeMoreView({
    Key? key,
    super.margin,
    super.padding,
    this.initHeight = 300,
    this.triggerSeeMore = true,
    this.seeMoreWidget,
    this.seeLessWidget,
    required super.child,
    this.seeMoreLabel,
    this.seeLessLabel,
    this.bottomOffset = 15,
    this.gradientRatio = 0.5,
    this.duration = const Duration(milliseconds: 300),
  })  : assert((seeMoreWidget == null && seeMoreLabel != null && seeLessWidget == null && seeLessLabel != null) ||
            (seeMoreWidget != null && seeMoreLabel == null && seeLessWidget != null && seeLessLabel == null)),
        super(key: key);

  @override
  _SeeMoreViewState createState() => _SeeMoreViewState();
}

class _SeeMoreViewState extends BaseWidgetState<BFSeeMoreView> {
  late ValueNotifier<bool> seeMoreNotifier;
  bool shouldSeeMore = false;

  @override
  void initState() {
    super.initState();
    seeMoreNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    seeMoreNotifier.dispose();
    super.dispose();
  }

  Widget renderSeeIndicator() {
    return ValueListenableBuilder<bool>(
      valueListenable: seeMoreNotifier,
      builder: (context, value, _) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: 30,
            child: GestureDetector(
              onTap: () {
                seeMoreNotifier.value = !seeMoreNotifier.value;
              },
              child: Builder(builder: (context) {
                if (seeMoreNotifier.value && widget.seeLessWidget != null) {
                  return widget.seeLessWidget!;
                }
                if (!seeMoreNotifier.value && widget.seeMoreWidget != null) {
                  return widget.seeMoreWidget!;
                }
                return Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: CommonColor.primary),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          !value ? widget.seeMoreLabel! : widget.seeLessLabel!,
                          style: const TextStyle(color: CommonColor.primary, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Icon(
                          !value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                          color: CommonColor.primary,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (widget.triggerSeeMore) ...[
            ValueListenableBuilder<bool>(
                valueListenable: seeMoreNotifier,
                builder: (context, value, child) {
                  return AnimatedCrossFade(
                    firstChild: Container(
                      height: null,
                      margin: EdgeInsets.only(bottom: widget.bottomOffset),
                      child: widget.child!,
                    ),
                    secondChild: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(Rect.fromLTRB(rect.width * widget.gradientRatio, rect.height * widget.gradientRatio, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        height: widget.initHeight,
                        margin: EdgeInsets.only(bottom: widget.bottomOffset),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [widget.child!],
                        ),
                      ),
                    ),
                    crossFadeState: seeMoreNotifier.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: widget.duration,
                  );
                }),
            renderSeeIndicator(),
          ] else ...[
            widget.child!
          ],
        ],
      ),
    );
  }
}
