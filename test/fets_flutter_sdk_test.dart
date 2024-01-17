import 'package:fets_flutter_sdk/fets_flutter_sdk.dart';
import 'package:fets_flutter_sdk/fets_flutter_sdk_method_channel.dart';
import 'package:fets_flutter_sdk/fets_flutter_sdk_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFetsFlutterSdkPlatform
    with MockPlatformInterfaceMixin
    implements FetsFlutterSdkPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> fetsPosCardPayment() {
    // TODO: implement fetsPosCardPayment
    throw UnimplementedError();
  }
}

void main() {
  final FetsFlutterSdkPlatform initialPlatform =
      FetsFlutterSdkPlatform.instance;

  test('$MethodChannelFetsFlutterSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFetsFlutterSdk>());
  });

  test('getPlatformVersion', () async {
    FetsFlutterSdk fetsFlutterSdkPlugin = FetsFlutterSdk();
    MockFetsFlutterSdkPlatform fakePlatform = MockFetsFlutterSdkPlatform();
    FetsFlutterSdkPlatform.instance = fakePlatform;

    expect(await fetsFlutterSdkPlugin.getPlatformVersion(), '42');
  });
}
