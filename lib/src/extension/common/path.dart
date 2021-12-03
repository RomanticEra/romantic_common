// coverage:ignore-file
import 'package:path/path.dart';
import 'package:recase/recase.dart';
import 'package:universal_io/io.dart';

/// Get ProjectRoot
Directory rootDir([String label = 'MASON_CACHE']) {
  if (Platform.environment.containsKey(label.constantCase)) {
// coverage:ignore-start
    return Directory(Platform.environment[label.constantCase]!);
  } else if (Platform.isWindows) {
    final appData = Platform.environment['APPDATA']!;
    final appDataCacheDir =
        Directory(join(appData, label.headerCase.replaceAll(RegExp('-'), '/')));
    if (appDataCacheDir.existsSync()) return Directory(appDataCacheDir.path);
    final localAppData = Platform.environment['LOCALAPPDATA']!;
    return Directory(
      join(localAppData, label.headerCase.replaceAll(RegExp('-'), '/')),
    );
// coverage:ignore-end
  } else {
    return Directory(
      join(Platform.environment['HOME']!, '.${label.paramCase}'),
    );
  }
}
