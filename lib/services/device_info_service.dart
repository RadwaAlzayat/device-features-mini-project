import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoService {
  /// Returns the device model and OS version as a readable text.
  Future<String> getDeviceDescription() async {
    final deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      final webInfo = await deviceInfo.webBrowserInfo;
      return 'Browser: ${webInfo.browserName.name}\nPlatform: ${webInfo.platform}';
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return 'Model: ${androidInfo.model}\nAndroid ${androidInfo.version.release}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return 'Model: ${iosInfo.model}\niOS ${iosInfo.systemVersion}';
    } else {
      return 'Unsupported platform';
    }
  }
}
