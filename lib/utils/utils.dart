import 'dart:io';

import 'package:network_info_plus/network_info_plus.dart';

class Utils {
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;

  static bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  static Future<String?> getIPAddress() async {
    return NetworkInfo().getWifiIP();
  }
}
