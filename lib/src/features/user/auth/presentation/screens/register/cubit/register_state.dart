part of 'register_cubit.dart';

enum RegisterUserStatus { initial, loading, success, failure }

class RegisterUserState extends Equatable {
  final RegisterUserStatus status;
  final String? message;
  const RegisterUserState({
    this.status = RegisterUserStatus.initial,
    this.message,
  });

  RegisterUserState copyWith({
    RegisterUserStatus? status,
    String? message,
  }) =>
      RegisterUserState(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [status, message];
}
