import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fets_flutter_sdk_method_channel.dart';

abstract class FetsFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a FetsFlutterSdkPlatform.
  FetsFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FetsFlutterSdkPlatform _instance = MethodChannelFetsFlutterSdk();

  /// The default instance of [FetsFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFetsFlutterSdk].
  static FetsFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FetsFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(FetsFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> fetsPosCardPayment() {
    throw UnimplementedError('fetsPosCardPayment() has not been implemented.');
  }
}
