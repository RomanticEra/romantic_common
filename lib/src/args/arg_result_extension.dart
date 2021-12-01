import 'package:args/args.dart';

/// Implement [dict] to get input param form Command
extension Dict on ArgResults {
  /// snippet to implement [dict] to get input param form Command
  ///
  /// Get value from [options],[rest] through [dict],
  /// it would throw if there is no result of value found.
  ///
  /// Example:
  /// * String get configPath => dict('config-path', 0);
  /// * String get brickDir => dict('brick-dir', 0);
  /// * String get bundlePath => dict('json-path', 0);
  ///
  /// Hint:
  /// * input of dict is only associated with ArgResults,
  String dict(String key, int index) {
    if (options.contains(key)) {
      return this[key] as String;
    }
    if (rest.length > index) return rest[index];
    throw ArgParserException('$key cloud not find.');
  }
}
