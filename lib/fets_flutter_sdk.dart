
import 'fets_flutter_sdk_platform_interface.dart';

class FetsFlutterSdk {
  Future<String?> getPlatformVersion() {
    return FetsFlutterSdkPlatform.instance.getPlatformVersion();
  }
}
