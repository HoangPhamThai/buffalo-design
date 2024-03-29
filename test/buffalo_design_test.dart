import 'package:flutter_test/flutter_test.dart';
import 'package:buffalo_design/buffalo_design.dart';
import 'package:buffalo_design/buffalo_design_platform_interface.dart';
import 'package:buffalo_design/buffalo_design_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBuffaloDesignPlatform
    with MockPlatformInterfaceMixin
    implements BuffaloDesignPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BuffaloDesignPlatform initialPlatform = BuffaloDesignPlatform.instance;

  test('$MethodChannelBuffaloDesign is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBuffaloDesign>());
  });

  test('getPlatformVersion', () async {
    BuffaloDesign buffaloDesignPlugin = BuffaloDesign();
    MockBuffaloDesignPlatform fakePlatform = MockBuffaloDesignPlatform();
    BuffaloDesignPlatform.instance = fakePlatform;

    expect(await buffaloDesignPlugin.getPlatformVersion(), '42');
  });
}
