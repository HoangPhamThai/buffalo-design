import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'buffalo_design_method_channel.dart';

abstract class BuffaloDesignPlatform extends PlatformInterface {
  /// Constructs a BuffaloDesignPlatform.
  BuffaloDesignPlatform() : super(token: _token);

  static final Object _token = Object();

  static BuffaloDesignPlatform _instance = MethodChannelBuffaloDesign();

  /// The default instance of [BuffaloDesignPlatform] to use.
  ///
  /// Defaults to [MethodChannelBuffaloDesign].
  static BuffaloDesignPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BuffaloDesignPlatform] when
  /// they register themselves.
  static set instance(BuffaloDesignPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
