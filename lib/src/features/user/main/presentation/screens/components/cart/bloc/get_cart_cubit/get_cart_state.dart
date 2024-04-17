part of 'get_cart_cubit.dart';

enum GetCartStatus {
  initial,
  loading,
  success,
  failure,
}

class GetCartState extends Equatable {
  final String? message;
  final GetCartStatus status;
  final GetCartResponseModel? cartItems;
  const GetCartState({
    this.message,
    this.status = GetCartStatus.initial,
    this.cartItems,
  });

  GetCartState copyWith({
    String? message,
    GetCartStatus? status,
    GetCartResponseModel? cartItems,
  }) => GetCartState(
    message: message ?? this.message,
    status: status ?? this.status,
    cartItems: cartItems ?? this.cartItems,
  );

  @override
  List<Object?> get props => [
    message,
    status,
    cartItems
  ];
}
