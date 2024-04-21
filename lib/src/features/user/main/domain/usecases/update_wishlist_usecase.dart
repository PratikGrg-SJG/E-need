import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/models/common_request_model.dart';

import '../../data/models/common_response_model.dart';

class UpdateWishlistUsecase extends UseCase<CommonResponseModel, CommonRequestModel> {
  final MainRepository _mainRepository;
  UpdateWishlistUsecase(this._mainRepository);
  @override
  Future<Either<Failure, CommonResponseModel>> call(CommonRequestModel params) {
    return _mainRepository.updateWishlist(params);
  }
}
