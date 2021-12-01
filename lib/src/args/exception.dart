// coverage:ignore-file
import 'package:args/command_runner.dart';

/// to split Exception between mason and masonx
class ExException extends UsageException {
  // ignore: public_member_api_docs
  ExException(String message, String usage) : super(message, usage);
}
