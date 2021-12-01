<!-- This file uses generated code. Visit https://pub.dev/packages/readme_helper for usage information. -->
# romantic_common

[![build: status][actions_badge]][actions_link] [![pub package][pub_badge]][pub_link]
[![style: analysis][analysis_badge]][analysis_link]
[![License: MIT][license_badge]][license_link]

Package including lot helpers for easy developing on dart language.

[actions_badge]: https://github.com/huang12zheng/romantic_common/actions/workflows/main.yaml/badge.svg
[actions_link]: https://github.com/huang12zheng/romantic_common/actions/workflows/main.yaml
[pub_badge]:https://img.shields.io/pub/v/romantic_common.svg
[pub_link]:https://pub.dartlang.org/packages/romantic_common
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[analysis_badge]: https://img.shields.io/badge/style-romantic__analysis-purple
[analysis_link]: https://github.com/RomanticEra/romantic_analysis


# Usage
## args
### argParse
* rule:
(1) You need to configure the order of commands
```dart
class BrickFromCommand extends MasonCommandBase {
  /// construct throught [CommandAdapter]
  BrickFromCommand()
      : super(
          'bundleF',
          exampleKey,
          'Get brick template from bundle or dart.',
          ['bf', 'bundle_from'],
          ///<<<<<<<<<<<>>>>>>>>>>>
          [MasonParseEnum.bundlePath, MasonParseEnum.outputDir],
        );
```
(2) If the argument is option,(-xxx), you can use cli in any order
```dart
final derivedArgResult0 =
    command.argParser.parse(['--json-path', bundlePath, '-o', outdir.path]);
final argResult3 = command.argParser.parse([bundlePath, outdir.path]);
...
///>>>>>>
```
(3) The rest unmatched arguments will be matched sequentially with those configured in (1) but not matched in (2)
```dart
expect(derivedArgResult0.dict('bundle-path', -1), bundlePath);
expect(derivedArgResult0.dict('output-dir', -1), outdir.path);

expect(argResult3.dict('bundle-path', 0), bundlePath);
expect(argResult3.dict('output-dir', 1), outdir.path);
```

### get propty util
```dart
mixin MasonPropMixin on IArgument2Statistical<MasonParseEnum> {
  String get bundlePath => statistical.enumParse(MasonParseEnum.bundlePath);
/// in this example, bundlePath would be simple use to handle command.
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
