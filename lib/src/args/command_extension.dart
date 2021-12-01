// coverage:ignore-file
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

/// Expose Prop, facade of [ArgResults]
extension ArgResultsPropFacade<T> on Command<T> {
  /// [ArgResults] for the current command.
  ///
  /// Example:
  /// * results.rest[0]
  ArgResults get results => argResults!;
}
