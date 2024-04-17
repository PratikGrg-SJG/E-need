part of 'get_orders_cubit.dart';

enum GetOrdersStatus {
  initial,
  loading,
  success,
  failure,
}

class GetOrdersState extends Equatable {
  final String? message;
  final GetOrdersStatus status;
  final OrderResponseModel? orderResponseModel;

  const GetOrdersState({
    this.message,
    this.status = GetOrdersStatus.initial,
    this.orderResponseModel,
  });

  GetOrdersState copyWith({
    String? message,
    GetOrdersStatus? status,
    OrderResponseModel? orderResponseModel,
  }) =>
      GetOrdersState(
        message: message ?? this.message,
        status: status ?? this.status,
        orderResponseModel: orderResponseModel ?? this.orderResponseModel,
      );

  @override
  List<Object?> get props => [
        message,
        status,
        orderResponseModel,
      ];
}
