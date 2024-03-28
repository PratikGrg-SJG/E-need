import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/models/common_request_model.dart';

import '../repositories/main_repository.dart';

class GetAllProductsUsecase
    extends UseCase<ProductsResponseModel, CommonRequestModel> {
  final MainRepository _mainRepository;
  GetAllProductsUsecase(this._mainRepository);
  @override
  Future<Either<Failure, ProductsResponseModel>> call(
      CommonRequestModel params) {
    return _mainRepository.getAllProducts(params);
  }
}
