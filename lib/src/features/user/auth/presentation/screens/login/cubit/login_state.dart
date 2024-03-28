part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? message;
  final LoginResponseModel? loginResponseModel;
  const LoginState({
    this.message,
    this.loginResponseModel,
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    String? message,
    LoginStatus? status,
    LoginResponseModel? loginResponseModel,
  }) =>
      LoginState(
        message: message ?? this.message,
        status: status ?? this.status,
        loginResponseModel: loginResponseModel ?? this.loginResponseModel,
      );

  @override
  List<Object?> get props => [
        message,
        status,
        loginResponseModel,
      ];
}
