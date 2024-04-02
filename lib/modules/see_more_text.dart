import 'dart:math';

import 'package:buffalo_design/core/styles/colors.dart';
import 'package:flutter/material.dart';

class BFSeeMoreText extends StatefulWidget {
  const BFSeeMoreText({
    super.key,
    required this.content,
    this.minLength = 30,
    this.contentStyle,
    required this.labelSeeLess,
    required this.labelSeeMore,
    this.moreLessStyle,
  });

  final String content;
  final int minLength;
  final TextStyle? contentStyle;
  final String labelSeeMore;
  final String labelSeeLess;
  final TextStyle? moreLessStyle;

  @override
  State<BFSeeMoreText> createState() => _BFSeeMoreTextState();
}

class _BFSeeMoreTextState extends State<BFSeeMoreText> {
  late String shortContent;
  bool shouldShowMore = false;

  @override
  void initState() {
    super.initState();
    shortContent = widget.content.substring(0, min(widget.content.length, widget.minLength));
    if (widget.content.length > widget.minLength) {
      shortContent += '... ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          shouldShowMore ? widget.content : shortContent,
          style: widget.contentStyle,
        ),
        if (widget.content.length > widget.minLength) ...[
          GestureDetector(
            onTap: () {
              setState(() {
                shouldShowMore = !shouldShowMore;
              });
            },
            child: Text(
              shouldShowMore ? widget.labelSeeLess : widget.labelSeeMore,
              style: widget.moreLessStyle ??
                  TextStyle(
                    fontSize: widget.contentStyle?.fontSize,
                    color: CommonColor.primary,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Wrap(
  //     children: [
  //       Text(
  //         shouldShowMore ? widget.content : shortContent,
  //         style: widget.contentStyle,
  //       ),
  //       if (widget.content.length > widget.minLength) ...[
  //         GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               shouldShowMore = !shouldShowMore;
  //             });
  //           },
  //           child: Text(
  //             shouldShowMore ? widget.labelSeeLess : widget.labelSeeMore,
  //             style: widget.moreLessStyle ??
  //                 TextStyle(
  //                   fontSize: widget.contentStyle?.fontSize,
  //                   color: CommonColor.primary,
  //                   decoration: TextDecoration.underline,
  //                 ),
  //           ),
  //         ),
  //       ],
  //     ],
  //   );
  // }
}
