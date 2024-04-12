import 'package:flutter/material.dart';

class BFFormHandler {
  Map<String, dynamic> _map = {};
  GlobalKey<FormState>? _formKey;

  BFFormHandler() {
    _formKey = GlobalKey<FormState>();
  }

  GlobalKey<FormState> get key {
    if (_formKey != null) {
      return _formKey!;
    }
    throw Exception("The form key is null");
  }

  void _checkAssignGate(String key, Map<String, dynamic> map) {
    if (map.containsKey(key)) {
      throw Exception("$key is already assigned in the form");
    }
  }

  void add<T>(String key, T value) {
    _checkAssignGate(key, _map);
    _map[key] = value;
  }

  T get<T>(String key) {
    if (_map.containsKey(key)) {
      return _map[key];
    }
    throw Exception("No '$key' is assigned in the form");
  }

  void set(String key, dynamic value) {
    if (!_map.containsKey(key)) {
      throw Exception("No '$key' is assigned in the form");
    }
    if (_map[key] is TextEditingController) {
      (_map[key] as TextEditingController).text = value;
      return;
    }
    if (_map[key] is ValueNotifier) {
      (_map[key] as ValueNotifier).value = value;
      return;
    }
    _map[key] = value;
  }

  Map<String, dynamic> getAll() {
    return _map;
  }

  void reset() {
    _map = {};
    _formKey = null;
  }
}
