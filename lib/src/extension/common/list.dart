import 'package:recase/recase.dart';
import 'string.dart';

/// RelationshipBetwwenOther
extension RelationshipBetwwenOther on Iterable<String> {
  /// Example:
  /// ```dart
  /// toOption([a,3,b,2,1,c,4])=>[3,2,4]
  /// [1,2,3,4].findIndexOnOther([3,2,4])=> [-1,2,1,3]
  /// ```
  Iterable<int> findIndexOnOther(Iterable<String> other) =>
      map((e) => other.toList().indexOf(e));

  /// throught noExitCountWithPreorder, you could get how many element,
  /// which is no exist on options, preOrder on index,noExitCountWithPreorder
  List<int> calculateNotExistPreOrderCount(List<String> options) {
    final source = findIndexOnOther(options).toList();

    final noExitPreOrderCount = List<int>.filled(length, 0);

    int getNotExistValue(List<int> source, int id) {
      bool isNotExist(int value) => value == -1;
      return isNotExist(source[id]) ? 1 : 0;
    }

    noExitPreOrderCount[0] = getNotExistValue(source, 0);

    for (var i = 1; i < source.length; i++) {
      noExitPreOrderCount[i] =
          noExitPreOrderCount[i - 1] + getNotExistValue(source, i);
    }
    return noExitPreOrderCount;
  }

  /// map argument to AscendingSequence.
  Map<String, int> getPreOrderNoExistMap(List<String> options) =>
      Map<String, int>.fromIterables(
        this,
        calculateNotExistPreOrderCount(options).toList(),
      );
}

/// Switch
extension Switch<T> on Iterable<T> {
  /// switch to List<ParamCase>
  List<String> get toParamCase =>
      map((e) => e.toString().enumNormalized.paramCase).toList();
}

/// DecodeBase64
extension DecodeBase64 on List<int> {
  /// DecodeBase64
  String get fromCharCodes => String.fromCharCodes(this);
}
