import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'file_saver_platform_interface.dart';

/// An implementation of [FileSaverPlatform] that uses method channels.
class MethodChannelFileSaver extends FileSaverPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('file_saver');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
