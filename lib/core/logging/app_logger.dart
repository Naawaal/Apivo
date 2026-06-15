import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import 'log_level.dart';

abstract final class AppLogger {
  static LogLevel _minLevel = LogLevel.debug;
  static bool _initialized = false;

  static void init({LogLevel minLevel = LogLevel.debug}) {
    _minLevel = minLevel;
    _initialized = true;
  }

  static void debug(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.debug, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  static void info(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.info, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  static void warning(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.warning, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!_initialized) {
      init();
    }

    if (!kDebugMode) return;
    if (level.priority < _minLevel.priority) return;

    final timestamp = _formatTimestamp(DateTime.now());
    final levelLabel = level.name.toUpperCase();
    final tagLabel = tag != null ? ' [$tag]' : '';
    final formatted = '[$timestamp] [$levelLabel]$tagLabel $message';

    developer.log(
      formatted,
      name: tag ?? 'Apivo',
      error: error,
      stackTrace: stackTrace,
      level: _developerLevel(level),
    );
  }

  static String _formatTimestamp(DateTime time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    final s = time.second.toString().padLeft(2, '0');
    final ms = time.millisecond.toString().padLeft(3, '0');
    return '$h:$m:$s.$ms';
  }

  static int _developerLevel(LogLevel level) {
    return switch (level) {
      LogLevel.debug => 500,
      LogLevel.info => 800,
      LogLevel.warning => 900,
      LogLevel.error => 1000,
    };
  }
}
