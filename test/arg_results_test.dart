import 'package:args/args.dart';
import 'package:masonx/masonx.dart';
import 'package:romantic_common/romantic_common.dart';
import 'package:romantic_fake/romantic_fake.dart';
import 'package:test/test.dart';

void main() {
  group('ArgResultsPropFacade[dict]', () {
    group('[Enum ArgResult][ArgResultsPropFacade]', () {
      test('[FakeArgResults0][${argResult0.arguments}]', () {
        expect(argResult0.dict('bundle-path', -1), bundlePath);
        expect(argResult0.dict('output-dir', -1), outdir.path);
      });
      test('[FakeArgResults1][${argResult1.arguments}]', () {
        expect(argResult1.dict('bundle-path', -1), bundlePath);
        expect(argResult1.dict('output-dir', 0), outdir.path);
      });
      test('[FakeArgResults2][${argResult2.arguments}]', () {
        expect(argResult2.dict('bundle-path', 0), bundlePath);
        expect(argResult2.dict('output-dir', -1), outdir.path);
      });
      test('[FakeArgResults3][${argResult3.arguments}]', () {
        expect(argResult3.dict('bundle-path', 0), bundlePath);
        expect(argResult3.dict('output-dir', 1), outdir.path);
      });
      test('[derivedArgResult0][${derivedArgResult0.arguments}]', () {
        expect(derivedArgResult0.dict('bundle-path', -1), bundlePath);
        expect(derivedArgResult0.dict('output-dir', -1), outdir.path);
      });
    });
  });
  group('[Argument2Statistical]', () {
    // test('[argParseStrings]', () {
    //   final command = BrickFromCommand();
    //   expect(command.argParseConfigs.toParamCase, argParseStrings);
    // });

    group('Argument2Statistical', () {
      group('preOrderNoExistMap', () {
        test('[argResult0]', () {
          final reslut =
              Argument2Statistical<MasonParseEnum>(argResult0, argParseConfigs);
          expect(
            reslut.preOrderNoExistMap.toString(),
            '{bundle-path: 0, output-dir: 0}',
          );
        });
        test('[argResult1]', () {
          final reslut =
              Argument2Statistical<MasonParseEnum>(argResult1, argParseConfigs);
          expect(
            reslut.preOrderNoExistMap.toString(),
            '{bundle-path: 0, output-dir: 1}',
          );
        });
        test('[argResult2]', () {
          final reslut =
              Argument2Statistical<MasonParseEnum>(argResult2, argParseConfigs);
          expect(
            reslut.preOrderNoExistMap.toString(),
            '{bundle-path: 1, output-dir: 1}',
          );
        });
        test('[argResult3]', () {
          final reslut =
              Argument2Statistical<MasonParseEnum>(argResult3, argParseConfigs);
          expect(
            reslut.preOrderNoExistMap.toString(),
            '{bundle-path: 1, output-dir: 2}',
          );
        });
      });
      group('enumParse', () {
        test('[for argResult]', () {
          for (final r in [argResult0, argResult1, argResult2, argResult3]) {
            final reslut =
                Argument2Statistical<MasonParseEnum>(r, argParseConfigs);
            expect(
              reslut.enumParse(MasonParseEnum.bundlePath),
              bundlePath,
            );
            expect(
              reslut.enumParse(MasonParseEnum.outputDir),
              outdir.path,
            );
          }
        });
        // test('[argResult1]', () {
        //   final reslut =
        //       Argument2Statistical<MasonParseEnum>(argResult1, argParseConfigs);
        //   expect(
        //     reslut.enumParse(MasonParseEnum.bundlePath),
        //     bundlePath,
        //   );
        //   expect(
        //     reslut.enumParse(MasonParseEnum.outputDir),
        //     outdir.path,
        //   );
        // });
      });
    });
  });

  group('ArgumentParse[dict]', () {
    group('[Enum ArgResult][ArgResultsPropFacade]', () {
      test('[FakeArgResults0][${argResult0.arguments}]', () {
        expect(argResult0.dict('bundle-path', -1), bundlePath);
        expect(argResult0.dict('output-dir', -1), outdir.path);
      });
      test('[FakeArgResults1][${argResult1.arguments}]', () {
        expect(argResult1.dict('bundle-path', -1), bundlePath);
        expect(argResult1.dict('output-dir', 0), outdir.path);
      });
      test('[FakeArgResults2][${argResult2.arguments}]', () {
        expect(argResult2.dict('bundle-path', 0), bundlePath);
        expect(argResult2.dict('output-dir', -1), outdir.path);
      });
      test('[FakeArgResults3][${argResult3.arguments}]', () {
        expect(argResult3.dict('bundle-path', 0), bundlePath);
        expect(argResult3.dict('output-dir', 1), outdir.path);
      });
    });
    test('[catch ArgParserException][${exceptionArgResult0.arguments}]', () {
      try {
        exceptionArgResult0.dict('output-dir', 1);
        throw ExException('', '');
      } on ArgParserException catch (e) {
        expect(
          e.message,
          'output-dir cloud not find.',
        );
      }
    });
  });
}
