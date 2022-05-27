import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:file_saver/file_saver_method_channel.dart';

void main() {
  MethodChannelFileSaver platform = MethodChannelFileSaver();
  const MethodChannel channel = MethodChannel('file_saver');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
