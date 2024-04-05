import 'package:flutter/material.dart';

class BFMenuItem extends StatefulWidget {
  BFMenuItem({
    super.key,
    required this.label,
    required this.onTap,
    this.labelStyle,
  });
  String label;
  VoidCallback onTap;
  TextStyle? labelStyle;

  @override
  State<BFMenuItem> createState() => _BFMenuItemState();
}

class _BFMenuItemState extends State<BFMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.label,
        style: widget.labelStyle,
      ),
      onTap: widget.onTap,
    );
  }
}
