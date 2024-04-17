part of 'get_all_products_cubit.dart';

enum GetAllProductsStatus {
  initial,
  loading,
  success,
  failure,
}

class GetAllProductsState extends Equatable {
  final String? message;
  final GetAllProductsStatus status;
  final ProductsResponseModel? productsResponseModel;
  const GetAllProductsState({
    this.message,
    this.productsResponseModel,
    this.status = GetAllProductsStatus.initial,
  });

  GetAllProductsState copyWith({
    String? message,
    GetAllProductsStatus? status,
    ProductsResponseModel? productsResponseModel,
  }) =>
      GetAllProductsState(
        message: message ?? this.message,
        status: status ?? this.status,
        productsResponseModel:
            productsResponseModel ?? this.productsResponseModel,
      );

  @override
  List<Object?> get props => [
        message,
        status,
        productsResponseModel,
      ];
}
