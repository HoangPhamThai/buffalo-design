import 'package:flutter/material.dart';

class TimeLineEntity {
  Widget? customTitle;
  Widget? customDescription;
  Widget? customDot;
  String? title;
  String? description;
  VoidCallback? onTap;

  TimeLineEntity({
    this.description,
    this.title,
    this.customDot,
    this.customDescription,
    this.customTitle,
    this.onTap,
  });
}
