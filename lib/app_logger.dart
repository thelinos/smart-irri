// ignore_for_file: parameters
import "package:logger/logger.dart";

abstract final class AppLogger {
  static final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  static void t(
    Object message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void d(
    Object message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void i(
    Object message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void w(
    Object message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void e(
    Object message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void f(
    Object message, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.f(message, time: time, error: error, stackTrace: stackTrace);
  }
}
