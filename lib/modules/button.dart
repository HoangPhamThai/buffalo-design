import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

enum ButtonState { enable, loading, disable }

class BuffaloButton extends StatefulWidget {
  final ButtonState state;
  final Widget child;
  final bool enableLoading;
  final Widget? loadingChild;
  final VoidCallback? onPressed;
  final bool strokeOnly;
  final bool hasContentPadding;
  final double borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double minWidth;
  final double borderWidth;

  final Color? color;
  final Color? hoverColor;
  final Color disabledColor;
  final Color backgroundColor;
  final Color strokeColor;
  final Color strokeOnlyColor;

  const BuffaloButton({
    super.key,
    required this.child,
    this.enableLoading = false,
    this.loadingChild,
    this.onPressed,
    this.state = ButtonState.enable,
    this.strokeOnly = false,
    this.backgroundColor = Colors.white,
    this.borderRadius = 10,
    this.strokeColor = CommonColor.primary,
    this.padding,
    this.margin,
    this.height = 48,
    this.minWidth = 120,
    this.width,
    this.hoverColor,
    this.hasContentPadding = true,
    this.borderWidth = 1,
    this.strokeOnlyColor = CommonColor.primary,
    this.disabledColor = CommonColor.disabled,
    this.color,
  });

  @override
  State<BuffaloButton> createState() => _BuffaloButtonState();
}

class _BuffaloButtonState extends State<BuffaloButton> {
  Color getBorderColor() {
    if (widget.state == ButtonState.disable) {
      print('return disable border');
      return widget.disabledColor;
    }
    if (widget.strokeOnly) {
      print('return stroke only border');
      return widget.strokeOnlyColor;
    }
    print('return stroke border');
    return widget.strokeColor;
  }

  Color getBackgroundColor() {
    if (widget.state == ButtonState.disable) {
      return Colors.grey.withOpacity(0.2);
    }
    if (widget.strokeOnly) {
      return widget.backgroundColor;
    }
    return widget.color ?? Theme.of(context).primaryColor;
    // if (widget.state == ButtonState.enable) {
    //   return widget.color ?? Theme.of(context).primaryColor;
    // }
    // return Colors.grey;
  }

  Color getForegroundColor() {
    if (widget.state == ButtonState.disable) {
      return Colors.grey;
    }
    return widget.strokeOnly ? CommonColor.primary : Colors.white;
  }

  Widget renderLoadingWidget() {
    if (widget.state == ButtonState.loading) {
      return widget.loadingChild ??
          Container(
            margin: const EdgeInsets.only(right: 14),
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: widget.strokeOnly
                  ? widget.color ?? Theme.of(context).primaryColor
                  : Colors.white,
            ),
          );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      height: widget.height,
      child: TextButton(
        style: ButtonStyle(
          padding: widget.hasContentPadding
              ? MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 14))
              : MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                width: widget.borderWidth,
                color: getBorderColor(),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size.fromWidth(widget.minWidth),
          ),
          foregroundColor: MaterialStateProperty.all(getForegroundColor()),
          backgroundColor: MaterialStateProperty.all(getBackgroundColor()),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: widget.state == ButtonState.enable ? widget.onPressed : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            renderLoadingWidget(),
            widget.child,
          ],
        ),
      ),
    );
  }
}
