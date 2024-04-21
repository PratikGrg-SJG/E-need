part of 'opt_verify_cubit.dart';

enum VerifyStatus {
  initial,
  loading,
  success,
  failure,
}

class VerifyOtpState extends Equatable {
  final String? message;
  final VerifyStatus status;

  const VerifyOtpState({
    this.message,
    this.status = VerifyStatus.initial,
  });

  VerifyOtpState copyWith({
    String? message,
    VerifyStatus? status,
  }) => VerifyOtpState(
    message: message ?? this.message,
    status: status ?? this.status,
  );

  @override
  List<Object?> get props => [message, status];
}
