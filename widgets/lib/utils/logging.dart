import 'dart:developer' as developer;

class Logging {
  static void log(String message) =>
      developer.log(message, time: DateTime.now());

  static void logDetails(String message,
          [Object? error, StackTrace? stackTrace]) =>
      developer.log(
        message,
        time: DateTime.now(),
        level: 0,
        error: error,
        stackTrace: stackTrace,
      );
}
