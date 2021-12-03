import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:recase/recase.dart';

import '../extension/common/index.dart';
import 'arg_result_extension.dart';
import 'run_mixin.dart';

/// {@template Argument2Statistical}
/// use [_argParseConfigs] and [_results] to get some statistical.
/// [_argParseConfigs] is is config of [Command] with type of List<S>.
/// {@endtemplate}
///
/// See Also:
/// * [RunMixin]
/// Interface of run for [Command]
class Argument2Statistical<T> {
  /// construct with [ArgResults] and [RunMixin.argParseConfigs]
  Argument2Statistical(this._results, this._argParseConfigs);

  final ArgResults _results;
  final List<T> _argParseConfigs;

  /// Switch [_argParseConfigs] to [ReCase.paramCase] of Enum
  List<String> get argParseStrings => _argParseConfigs.toParamCase;

  Map<String, int>? _map;

  /// map Argument to NoExistMap on PreOrder
  ///
  /// use [_argParseConfigs] and [_results] to get some statistical.
  /// [_argParseConfigs] is is config of [Command] with type of List<S>.
  /// {@template NoExistMap}
  /// It get a value of no exist sequence on preoder.
  /// {@endtemplate}
  Map<String, int> get preOrderNoExistMap =>
      _map ??= argParseStrings.getPreOrderNoExistMap(_results.options.toList());
}

/// switch Argument to Value
extension ArgumentParse<T> on Argument2Statistical<T> {
  /// throught paramCase to get the value of param.
  String paramCaseParse(String paramCase) =>
      _results.dict(paramCase, (preOrderNoExistMap[paramCase] ?? 0) - 1);

  /// throught enum to get the value of param.
  String enumParse(T _enum) =>
      paramCaseParse(_enum.toString().enumNormalized.paramCase);
}
