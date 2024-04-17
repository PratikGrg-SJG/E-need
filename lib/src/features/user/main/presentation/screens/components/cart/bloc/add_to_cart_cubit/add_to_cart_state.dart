part of 'add_to_cart_cubit.dart';

enum AddToCartStatus {
  initial,
  loading,
  success,
  failure,
}

class AddToCartState extends Equatable {
  final String? message;
  final AddToCartStatus status;

  const AddToCartState({
    this.message,
    this.status = AddToCartStatus.initial,
  });

  AddToCartState copyWith({
    String? message,
    AddToCartStatus? status,
  }) =>
      AddToCartState(
        message: message ?? this.message,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}
