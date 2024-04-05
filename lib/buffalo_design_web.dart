import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'buffalo_design_platform_interface.dart';

/// A web implementation of the BuffaloDesignPlatform of the BuffaloDesign plugin.
class BuffaloDesignWeb extends BuffaloDesignPlatform {
  /// Constructs a BuffaloDesignWeb
  BuffaloDesignWeb();

  static void registerWith(Registrar registrar) {
    BuffaloDesignPlatform.instance = BuffaloDesignWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
