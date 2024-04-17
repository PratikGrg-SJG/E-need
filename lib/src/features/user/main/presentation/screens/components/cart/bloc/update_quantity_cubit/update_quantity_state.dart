part of 'update_quantity_cubit.dart';

enum UpdateQuantityStatus { initial, loading, success, failure }

class UpdateQuantityState extends Equatable {
  final String? message;
  final UpdateQuantityStatus status;
  final QuantityUpdatedResponseModel? quantityUpdatedResponseModel;
  const UpdateQuantityState({
    this.message,
    this.status = UpdateQuantityStatus.initial,
    this.quantityUpdatedResponseModel,
  });

  UpdateQuantityState copyWith({
    String? message,
    UpdateQuantityStatus? status,
    QuantityUpdatedResponseModel? quantityUpdatedResponseModel,
  }) =>
      UpdateQuantityState(
        message: message ?? this.message,
        status: status ?? this.status,
        quantityUpdatedResponseModel:
            quantityUpdatedResponseModel ?? this.quantityUpdatedResponseModel,
      );

  @override
  List<Object?> get props => [
        message,
        status,
        quantityUpdatedResponseModel,
      ];
}
