import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/order/order_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/models/common_request_model.dart';

class GetOrdersUsecase extends UseCase<OrderResponseModel, CommonRequestModel> {
  final MainRepository _mainRepository;
  GetOrdersUsecase(this._mainRepository);
  @override
  Future<Either<Failure, OrderResponseModel>> call(CommonRequestModel params) {
    return _mainRepository.getOrders(params);
  }
}
