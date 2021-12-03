import 'package:masonx/masonx.dart';
import 'package:romantic_common/src/extension/common/list.dart';
import 'package:romantic_common/src/test/override_print.dart';
import 'package:test/test.dart';

void main() {
  final runner = masonx;

  test(
    '[description]',
    overridePrint(() async {
      await runner.run(['bf', '-h']);
      expect(
        printLogs[0].split('\n')[0],
        'Get brick template from bundle or dart.',
      );
    }),
  );
  test('[fromCharCodes]', () {
    expect(
      [72, 101, 108, 108, 111, 32, 123, 123, 110, 97, 109, 101, 125, 125, 33]
          .fromCharCodes,
      'Hello {{name}}!',
    );
  });
}
