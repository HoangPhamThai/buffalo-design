import 'package:buffalo_design/core/base_widgets/base_border_widget.dart';
import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BFButton extends BaseBorderWidget {
  final bool enableLoading;
  final Widget? loadingChild;
  final VoidCallback? onPressed;
  final bool hasContentPadding;

  final bool isLoading;

  final Color? contentColor;
  final Color? hoverColor;

  const BFButton({
    super.key,
    this.enableLoading = false,
    this.loadingChild,
    this.onPressed,
    this.hoverColor,
    this.hasContentPadding = true,
    this.contentColor,
    this.isLoading = false,
    super.height = 48,
    super.minWidth = 120,
    super.padding,
    super.margin,
    super.status,
    required super.child,
    super.strokeOnly,
    super.backgroundColor,
    super.borderColor,
    super.borderRadius,
    super.borderWidth,
    super.customBorderRadius,
    super.disabledColor,
    super.strokeColor,
    super.strokeOnlyColor,
    super.needBorder,
  });

  @override
  _BuffaloButtonState createState() => _BuffaloButtonState();
}

class _BuffaloButtonState extends BaseBorderWidgetState<BFButton> {
  Widget renderLoadingWidget() {
    if (widget.isLoading) {
      return widget.loadingChild ??
          Container(
            margin: const EdgeInsets.only(right: 14),
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: widget.strokeOnly ? widget.contentColor ?? Theme.of(context).primaryColor : Colors.white,
            ),
          );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBorderWidget(
        padding: widget.hasContentPadding ? widget.padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 14) : EdgeInsets.zero,
        margin: widget.margin,
        customBorderRadius: widget.customBorderRadius,
        borderRadius: widget.borderRadius,
        borderWidth: widget.borderWidth,
        backgroundColor: widget.backgroundColor,
        borderColor: widget.borderColor,
        strokeOnly: widget.strokeOnly,
        status: widget.status,
        strokeColor: widget.strokeColor,
        strokeOnlyColor: widget.strokeOnlyColor,
        disabledColor: widget.disabledColor,
        height: widget.height,
        width: widget.width,
        minWidth: widget.minWidth,
        needBorder: widget.needBorder,
        child: GestureDetector(
          onTap: widget.status == WidgetStatus.enable ? widget.onPressed : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              renderLoadingWidget(),
              AbsorbPointer(
                absorbing: true,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      widget.strokeOnly ? widget.contentColor ?? Theme.of(context).primaryColor : Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: widget.child!,
                ),
              ),
            ],
          ),
        ));
  }
}
