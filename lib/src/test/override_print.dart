import 'dart:async';

/// To get Error info
List<String> printLogs = <String>[];

/// To get Error info with no error
void Function() overridePrint(void Function() fn) => () {
      final spec = ZoneSpecification(
        print: (_, __, ___, msg) {
          printLogs.add(msg);
        },
      );
      return Zone.current.fork(specification: spec).run<void>(fn);
    };
