import 'dart:convert';

import 'package:recase/recase.dart';
import 'package:universal_io/io.dart';

/// GetJsonFile
extension GetJsonFile on String {
// coverage:ignore-start
  /// ```
  /// return MasonBundle.fromJson(bundlePath.getFileWithJsonSync)
  /// ```
  Map<String, dynamic> get getFileWithJsonSync {
    final jsonFile = File(this);
    final jsonStr = jsonFile.readAsStringSync();
    final json = jsonDecode(jsonStr) as Map<String, dynamic>;
    return json;
  }
// coverage:ignore-end

  /// ```
  /// return MasonBundle.fromJson(await bundlePath.getFileWithJson)
  /// ```
  Future<Map<String, dynamic>> get getFileWithJson async {
    final jsonFile = File(this);
    final jsonStr = await jsonFile.readAsString();
    final json = jsonDecode(jsonStr) as Map<String, dynamic>;
    return json;
  }
}

/// extension about Enum
extension EnumParser on String {
  /// switch to enum
  T toEnum<T>(List<T> values) => values.firstWhere(
        (e) => e.toString().enumNormalized == camelCase,
      );

  /// swtich to enum (last word)
  ///
  /// Example:
  /// * MasonParseEnum.bundlePath => bundlePath
  String get enumNormalized => split('.').last;
}
