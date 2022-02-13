import 'package:meta/meta.dart';

/// Base Result class
///
/// Receives two values [E] and [S]
/// as [E] is an error and [S] is a success.
@sealed
abstract class Result<E, S> {
  /// Default constructor.
  const Result();

  /// Returns the current result.
  ///
  /// It may be a [Success] or an [Error].
  /// Check with
  /// ```dart
  ///   result.isSuccess();
  /// ```
  /// or
  /// ```dart
  ///   result.isError();
  /// ```
  ///
  /// before casting the value;
  dynamic get();

  /// Returns the value of [S].
  S? getSuccess();

  /// Returns the value of [E].
  E? getError();

  /// Returns true if the current result is an [Error].
  bool isError();

  /// Returns true if the current result is a [success].
  bool isSuccess();

  /// Return the result in one of these functions.
  ///
  /// if the result is an error, it will be returned in
  /// [whenError],
  /// if it is a success it will be returned in [whenSuccess].
  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  );
}

/// Success Result.
///
/// return it when the result of a [Result] is
/// the expected value.
@immutable
class Success<E, S> implements Result<E, S> {
  /// Receives the [S] param as
  /// the successful result.
  const Success(
    this._success,
  );

  final S _success;

  @override
  S get() {
    return _success;
  }

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Success && other._success == _success;

  @override
  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  ) {
    return whenSuccess(_success);
  }

  @override
  E? getError() => null;

  @override
  S? getSuccess() => _success;
}

/// Error Result.
///
/// return it when the result of a [Result] is
/// not the expected value.
@immutable
class Error<E, S> implements Result<E, S> {
  /// Receives the [E] param as
  /// the error result.
  const Error(this._error);

  final E _error;

  @override
  E get() {
    return _error;
  }

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _error.hashCode;

  @override
  bool operator ==(Object other) => other is Error && other._error == _error;

  @override
  W when<W>(
    W Function(E error) whenError,
    W Function(S succcess) whenSuccess,
  ) {
    return whenError(_error);
  }

  @override
  E? getError() => _error;

  @override
  S? getSuccess() => null;
}

/// Default success class.
///
/// Instead of returning void, as
/// ```dart
///   Result<Exception, void>
/// ```
/// return
/// ```dart
///   Result<Exception, SuccessResult>
/// ```
class SuccessResult {
  const SuccessResult._internal();
}

/// Default success case.
const success = SuccessResult._internal();
