import 'package:masonx/masonx.dart';
import 'package:romantic_common/romantic_common.dart';
import 'package:romantic_common/src/test/override_print.dart';
import 'package:romantic_fake/romantic_fake.dart';
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
}
