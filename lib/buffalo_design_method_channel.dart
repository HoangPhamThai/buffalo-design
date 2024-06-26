import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'buffalo_design_platform_interface.dart';

/// An implementation of [BuffaloDesignPlatform] that uses method channels.
class MethodChannelBuffaloDesign extends BuffaloDesignPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_web');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
