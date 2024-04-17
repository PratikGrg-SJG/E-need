import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';

import '../../data/models/cart/add_to_cart_request_model.dart';
import '../../data/models/cart/add_to_cart_response_model.dart';

class AddToCartUsecase
    extends UseCase<AddToCartResponseModel, AddToCartRequestModel> {
  final MainRepository _mainRepository;
  AddToCartUsecase(this._mainRepository);
  @override
  Future<Either<Failure, AddToCartResponseModel>> call(
      AddToCartRequestModel params) {
    return _mainRepository.addToCart(params);
  }
}
