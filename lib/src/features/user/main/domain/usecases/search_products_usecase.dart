import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';

class SearchProductsUsecase extends UseCase<ProductsResponseModel, void> {
  final MainRepository _mainRepository;
  SearchProductsUsecase(this._mainRepository);
  @override
  Future<Either<Failure, ProductsResponseModel>> call(void params) {
    return _mainRepository.searchProducts();
  }
}
