part of 'update_wishlist_cubit.dart';

enum UpdateWishlistStatus {
  initial,
  loading,
  success,
  failure,
}

 class UpdateWishlistState extends Equatable {
  final UpdateWishlistStatus status;
  final String? message;
  
  const UpdateWishlistState({
    this.status = UpdateWishlistStatus.initial,
    this.message,
  });

  UpdateWishlistState copyWith({
    UpdateWishlistStatus? status,
    String? message,
  }) => UpdateWishlistState(
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  List<Object?> get props => [
    status,
    message,
  ];
}

