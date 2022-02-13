import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class NotConnectedFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class ItemNotFoundFailure extends Failure {}
