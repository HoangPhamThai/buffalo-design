
import 'buffalo_design_platform_interface.dart';

class BuffaloDesign {
  Future<String?> getPlatformVersion() {
    return BuffaloDesignPlatform.instance.getPlatformVersion();
  }
}
