import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'file_saver_method_channel.dart';

abstract class FileSaverPlatform extends PlatformInterface {
  /// Constructs a FileSaverPlatform.
  FileSaverPlatform() : super(token: _token);

  static final Object _token = Object();

  static FileSaverPlatform _instance = MethodChannelFileSaver();

  /// The default instance of [FileSaverPlatform] to use.
  ///
  /// Defaults to [MethodChannelFileSaver].
  static FileSaverPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FileSaverPlatform] when
  /// they register themselves.
  static set instance(FileSaverPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
