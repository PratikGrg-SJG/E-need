import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/quantity_updated_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/models/common_request_model.dart';

class UpdateQuantityUsecase
    extends UseCase<QuantityUpdatedResponseModel, CommonRequestModel> {
  final MainRepository _mainRepository;
  UpdateQuantityUsecase(this._mainRepository);
  @override
  Future<Either<Failure, QuantityUpdatedResponseModel>> call(params) {
    return _mainRepository.updateQuantity(params);
  }
}
