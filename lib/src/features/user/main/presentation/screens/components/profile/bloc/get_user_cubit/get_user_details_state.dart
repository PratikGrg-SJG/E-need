part of 'get_user_details_cubit.dart';

enum GetUserDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class GetUserDetailsState extends Equatable {
  final GetUserDetailsStatus status;
  final String? message;
  final UserDetailsResponseModel? userData;
  const GetUserDetailsState({
    this.message,
    this.userData,
    this.status = GetUserDetailsStatus.initial,
  });

  GetUserDetailsState copyWith({
    String? message,
    UserDetailsResponseModel? userData,
    GetUserDetailsStatus? status,
  }) =>
      GetUserDetailsState(
        message: message ?? this.message,
        userData: userData ?? this.userData,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        status,
        message,
        userData,
      ];
}
