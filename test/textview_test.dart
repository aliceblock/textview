import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:textview/textview.dart';

void main() {
  const MethodChannel channel = MethodChannel('textview');

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
    expect(await Textview.platformVersion, '42');
  });
}
