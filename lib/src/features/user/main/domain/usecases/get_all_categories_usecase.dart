import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/category/category_response_model.dart';
import 'package:e_needs/src/models/common_request_model.dart';

import '../repositories/main_repository.dart';

class GetAllCategoriesUsecase
    extends UseCase<List<CategoryResponseModel>?, CommonRequestModel> {
  final MainRepository _mainRepository;
  GetAllCategoriesUsecase(this._mainRepository);
  @override
  Future<Either<Failure, List<CategoryResponseModel>?>> call(
      CommonRequestModel params) {
    return _mainRepository.getAllCategories(params);
  }
}
