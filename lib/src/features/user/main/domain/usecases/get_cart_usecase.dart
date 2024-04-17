import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';

import '../../../../../models/common_request_model.dart';
import '../../data/models/cart/get_cart_response_model.dart';

class GetCartUsecase extends UseCase<GetCartResponseModel, CommonRequestModel> {
  final MainRepository _mainRepository;
  GetCartUsecase(this._mainRepository);
  @override
  Future<Either<Failure, GetCartResponseModel>> call(
      CommonRequestModel params) {
    return _mainRepository.getCart(params);
  }
}
