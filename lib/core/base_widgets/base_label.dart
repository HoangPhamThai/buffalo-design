import 'package:flutter/material.dart';

enum MarkPlace { front, back }

class BaseLabel extends StatelessWidget {
  const BaseLabel({
    super.key,
    this.labelMargin,
    required this.label,
    this.isRequired = false,
    this.style,
    this.hasColon = false,
    this.markPlace = MarkPlace.front,
  });

  final String label;
  final bool isRequired;
  final EdgeInsets? labelMargin;
  final TextStyle? style;
  final bool hasColon;
  final MarkPlace? markPlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: labelMargin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (markPlace == MarkPlace.front && isRequired) ...[
            const Text(
              "* ",
              style: TextStyle(color: Colors.red),
            ),
          ],
          Text(
            label,
            style: style ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (hasColon) ...[
            const Text(":"),
          ],
          if (markPlace == MarkPlace.back && isRequired) ...[
            const Text(
              " *",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }
}
