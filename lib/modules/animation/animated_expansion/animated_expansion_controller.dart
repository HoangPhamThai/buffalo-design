import 'package:flutter/material.dart';

class BFAnimatedExpansionController {
  late ValueNotifier<bool> _notifier;
  BFAnimatedExpansionController({bool isExpand = false}) {
    _notifier = ValueNotifier<bool>(isExpand);
  }

  ValueNotifier<bool> get getNotifier => _notifier;

  void expand() {
    _notifier.value = true;
  }

  void collapse() {
    _notifier.value = false;
  }

  bool get isExpand => _notifier.value;
}
