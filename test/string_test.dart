import 'package:masonx/masonx.dart';
import 'package:romantic_common/romantic_common.dart';
import 'package:romantic_fake/romantic_fake.dart';
import 'package:test/test.dart';

void main() {
  group('GetJsonFile', () {
    test('[getFileWithJson]', () async {
      final json = await 'test/asset/hook.json'.getFileWithJson;
      expect(
          json.toString(),
          // ignore: lines_longer_than_80_chars
          '{files: [{path: hooks.md, data: SGkge3tuYW1lfX0h, type: text}], hooks: [{path: post_gen.dart, data: aW1wb3J0ICdkYXJ0OmlvJzt2b2lkIG1haW4oKXtmaW5hbCBmaWxlPUZpbGUoJy5wb3N0X2dlbi50eHQnKTtmaWxlLndyaXRlQXNTdHJpbmdTeW5jKCdwb3N0X2dlbjoge3tuYW1lfX0nKTt9, type: text}, {path: pre_gen.dart, data: aW1wb3J0ICdkYXJ0OmlvJzt2b2lkIG1haW4oKXtmaW5hbCBmaWxlPUZpbGUoJy5wcmVfZ2VuLnR4dCcpO2ZpbGUud3JpdGVBc1N0cmluZ1N5bmMoJ3ByZV9nZW46IHt7bmFtZX19Jyk7fQ==, type: text}], name: hooks, description: A Hooks Example Template, vars: [name]}');
    });
  });
  group('EnumParser', () {
    test('toEnum', () {
      expect(
        'bundlePath'.toEnum<MasonParseEnum>(MasonParseEnum.values),
        MasonParseEnum.bundlePath,
      );
      expect(argResult0.dict('output-dir', -1), outdir.path);
    });
    test('enumNormalized', () {
      expect(MasonParseEnum.bundlePath.toString().enumNormalized, 'bundlePath');
    });
  });
}
