import 'package:path/path.dart';
import 'package:romantic_common/src/extension/common/path.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

void main() {
  test('[description]', () {
    expect(rootDir().path, join(Platform.environment['HOME']!, '.mason-cache'));
  });
}
