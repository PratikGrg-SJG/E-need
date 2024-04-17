part of 'add_order_cubit.dart';

enum AddOrderStatus {
  initial,
  loading,
  success,
  failure,
}

class AddOrderState extends Equatable {
  final String? message;
  final AddOrderStatus status;
  final AddOrderResponseModel? addOrderResponseModel;
  const AddOrderState({
    this.message,
    this.status = AddOrderStatus.initial,
    this.addOrderResponseModel,
  });
AddOrderState copyWith({
  String? message,
  AddOrderStatus? status,
  AddOrderResponseModel? addOrderResponseModel,
}) => AddOrderState(
  message: message ?? this.message,
  status: status ?? this.status,
  addOrderResponseModel: addOrderResponseModel ?? this.addOrderResponseModel,
);

  @override
  List<Object?> get props => [
    message,
    status,
    addOrderResponseModel 
  ];
}
