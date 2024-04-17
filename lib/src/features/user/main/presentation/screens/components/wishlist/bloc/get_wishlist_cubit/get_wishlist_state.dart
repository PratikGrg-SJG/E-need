part of 'get_wishlist_cubit.dart';

enum GetWishlistStatus {
  initial,
  loading,
  success,
  failure,
}

 class GetWishlistState extends Equatable {
  final GetWishlistStatus status;
  final String? message;
  final List<WishlistResponseModel>? wishlist;
  const GetWishlistState({
    this.status = GetWishlistStatus.initial,
    this.message,
    this.wishlist,
  });

GetWishlistState copyWith({
  GetWishlistStatus? status,
  String? message,
  List<WishlistResponseModel>? wishlist
}) => GetWishlistState(
  message: message ?? this.message,
  status: status ?? this.status,
  wishlist: wishlist ?? this.wishlist
);
  @override
  List<Object?> get props => [
    status,
    message,
    wishlist
  ];
}

