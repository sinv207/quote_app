import 'package:flutter/foundation.dart';

/// Log helper to use Turbo Console Log extension.
///
/// Pressing [ctrl] + alt + L
///
class ConsoleHelper {
  ConsoleHelper._();

  static final ConsoleHelper _instance = ConsoleHelper._();

  /// Singleton pattern
  factory ConsoleHelper() => _instance;

  static String empty = '';

  /// Log like JS 🚀 🚀 🚀
  void log([String? msg, dynamic value]) {
    // optional unnamed []
    // optional named {}
    if (kDebugMode) {
      try {
        debugPrint('$msg \t  ${value?.toString() ?? ''}');
      } catch (_) {
        print('🚀 ---------------------------');
        print('$msg');
        print(value);
        print('🚀 ---------------------------');
      }
    }
  }
}

ConsoleHelper console = ConsoleHelper();
