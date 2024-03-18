import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? customCode;
  const Failure(this.message, {this.customCode});

  @override
  List<Object?> get props => [message, customCode];
}

class ApiFailure extends Failure {
  const ApiFailure(String message, {int? customCode})
      : super(message, customCode: customCode);
}

class LocationFailure extends Failure {
  const LocationFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}
