part of 'update_profile_cubit.dart';

enum UpdateProfileStatus { initial, loading, success, failure }

class UpdateProfileState extends Equatable {
  final String? message;
  final UpdateProfileStatus status;

  const UpdateProfileState({
    this.message,
    this.status = UpdateProfileStatus.initial,
  });

  UpdateProfileState copyWith({String? message, UpdateProfileStatus? status}) =>
      UpdateProfileState(
        message: message ?? this.message,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [message, status];
}
