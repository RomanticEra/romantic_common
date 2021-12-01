// coverage:ignore-file
import 'dart:async';
import 'dart:core';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import 'arg_results.dart';
import 'command_extension.dart';
import 'exception.dart';

/// Interface of run for [Command]
///
/// [run] would call prehandle and [handle]
///
/// See Also:
/// * [Argument2Statistical]
/// {@marco Argument2Statistical}
mixin RunMixin<T, S> on IExample<T> {
  /// Argument2Statistical
  late Argument2Statistical<S> statistical;

  /// Set the location param with enum list for Command
  List<S> get argParseConfigs;

  /// Hint:
  /// * please override [handle]!!!
  ///
  /// due to [ArgResults.options] should call behind construction.
  /// we call it([Argument2Statistical]) in [Command.run]
  @override
  FutureOr<T> run() async {
    statistical = Argument2Statistical<S>(results, argParseConfigs);
    return await handle().onError<ArgParserException>((error, stackTrace) {
      throw ExException(error.message, example);
    });
  }

  // ignore: public_member_api_docs
  Future<T> handle() async {
    throw ExException('[handle] must override. please implement it', '');
  }
}

/// mixin example to extension
///
/// See Also:
/// * [RunMixin.run] => ExException(error.message, example)
abstract class IExample<T> extends Command<T> {
  /// The example of this command.
  String get example;

  /// desc of this command.
  String get desc;
  @override
  String get description => '$desc\n$example';
}

/// interface to util for MasonPropMixin
abstract class IArgument2Statistical<S> {
  /// statistical
  Argument2Statistical<S> get statistical;
}
