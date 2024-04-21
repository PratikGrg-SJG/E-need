part of 'get_products_by_category_cubit.dart';

enum GetProductsByCategoryStatus {
  initial,
  loading,
  success,
  failure,
}

class GetProductsByCategoryState extends Equatable {
  final String? message;
  final GetProductsByCategoryStatus status;
  final ProductsResponseModel? products;
  const GetProductsByCategoryState({
    this.message,
    this.status = GetProductsByCategoryStatus.initial,
    this.products,
  });

  GetProductsByCategoryState copyWith({
    String? message,
    GetProductsByCategoryStatus? status,
    ProductsResponseModel? products
  }) => GetProductsByCategoryState(
    message: message ?? this.message,
    status: status ?? this.status,
    products: products ?? this.products
  );

  @override
  List<Object?> get props => [
    message,
    status,
    products
  ];
}
