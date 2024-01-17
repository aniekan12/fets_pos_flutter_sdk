import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fets_flutter_sdk_platform_interface.dart';

/// An implementation of [FetsFlutterSdkPlatform] that uses method channels.
class MethodChannelFetsFlutterSdk extends FetsFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.fets.flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> fetsPosCardPayment() async {
    final version = await methodChannel.invokeMethod<String>('cardPayment');
    return version;
  }
}
