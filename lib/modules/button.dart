import 'package:buffalo_design/core/base_widgets/base_border_widget.dart';
import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BFButton extends BaseBorderWidget {
  /// Custom loading indicator
  final Widget? loadingChild;

  final VoidCallback? onPressed;

  /// set to [true] to show loading indicator
  final bool isLoading;

  /// if [strokeOnly] is true, the content will have [contentColor]
  final Color? contentColor;

  const BFButton({
    super.key,
    this.loadingChild,
    this.onPressed,
    this.contentColor,
    this.isLoading = false,
    super.height = 48,
    super.minWidth = 120,
    super.padding,
    super.margin,
    super.status,
    required super.child,

    /// set to true, the button will have no background color
    super.strokeOnly,

    /// background color of the button
    /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
    super.backgroundColor,

    /// the border's color
    /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
    super.borderColor,

    /// the border's radius
    /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
    super.borderRadius,

    /// the border's width
    /// only work when [needBorder] is true, [strokeOnly] is false and [status] is enable
    super.borderWidth,

    /// customize the border, e.g. only have border in the top corners
    /// only work when [needBorder] is true
    super.customBorderRadius,

    /// the color of button when [status] is disable
    super.disabledColor,

    /// the border's color when [strokeOnly] is true
    super.strokeColor,

    /// set to [true] to show border
    super.needBorder,
  });

  @override
  _BuffaloButtonState createState() => _BuffaloButtonState();
}

class _BuffaloButtonState extends BaseBorderWidgetState<BFButton> {
  Widget renderLoadingWidget() {
    if (widget.isLoading) {
      return widget.loadingChild ??
          SizedBox(
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
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8),
        margin: widget.margin,
        customBorderRadius: widget.customBorderRadius,
        borderRadius: widget.borderRadius,
        borderWidth: widget.borderWidth,
        backgroundColor: widget.backgroundColor,
        borderColor: widget.borderColor,
        strokeOnly: widget.strokeOnly,
        status: widget.status,
        strokeColor: widget.strokeColor,
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
