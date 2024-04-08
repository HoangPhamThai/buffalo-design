import 'package:buffalo_design/core/base_widgets/base_circle.dart';
import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design/utils/utils.dart';
import 'package:flutter/material.dart';

class BFAvatar extends BaseWidget {
  const BFAvatar({
    super.key,
    super.margin,
    super.padding,
    this.radius = 64,
    this.showBadge = false,
    this.badgeColor = Colors.green,
    required this.imageUrl,
    this.alternativeName = '',
    this.defaultAvatar,
    this.nameStyle,
    this.badge,
  });

  const BFAvatar.danger({
    super.key,
    super.margin,
    super.padding,
    this.radius = 64,
    this.showBadge = true,
    this.badgeColor = Colors.red,
    required this.imageUrl,
    this.alternativeName = '',
    this.defaultAvatar,
    this.nameStyle,
    this.badge,
  });

  final double radius;

  /// set to true to show a badge on the bottom right corner
  final bool showBadge;

  /// color of badge
  final Color badgeColor;

  final Widget? defaultAvatar;

  /// if it's not empty, the name will be shorten to use as an avatar
  final String alternativeName;

  /// URL of the avatar
  final String imageUrl;

  /// style of alternative name
  final TextStyle? nameStyle;

  /// Custom badge
  final Widget? badge;

  @override
  _BFAvatarState createState() => _BFAvatarState();
}

class _BFAvatarState extends BaseWidgetState<BFAvatar> {
  late bool hasAvatarUrl;
  late bool enableAlternativeName;

  @override
  void initState() {
    super.initState();
    hasAvatarUrl = widget.imageUrl.isNotEmpty;
    enableAlternativeName = widget.alternativeName.isNotEmpty;
  }

  Color getBackgroundColor() {
    if (hasAvatarUrl) {
      return Colors.grey.withOpacity(0.2);
    }
    if (enableAlternativeName) {
      return Colors.primaries[getColorIndex(widget.alternativeName)];
    }
    return Colors.grey.withOpacity(0.5);
  }

  ImageProvider? getBackgroundImage() {
    return hasAvatarUrl ? NetworkImage(widget.imageUrl) : null;
  }

  Widget getAvatar() {
    if (hasAvatarUrl) {
      return Container();
    }
    if (enableAlternativeName) {
      return Text(getShortName(widget.alternativeName), style: widget.nameStyle ?? TextStyle(fontSize: widget.radius, height: 1));
    }

    return widget.defaultAvatar ??
        Icon(
          Icons.person,
          size: widget.radius,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Stack(
        // mainAxisSize: MainAxisSize.min,
        alignment: Alignment.bottomCenter,
        children: [
          CircleAvatar(
            radius: widget.radius,
            backgroundColor: getBackgroundColor(),
            backgroundImage: getBackgroundImage(),
            child: getAvatar(),
          ),
          if (widget.showBadge) ...[
            widget.badge ??
                Positioned(
                  right: widget.radius / 5,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.white),
                    child: BaseCircle(
                      radius: widget.radius / 6,
                      backgroundColor: widget.badgeColor,
                    ),
                  ),
                ),
          ],
        ],
      ),
    );
  }
}
