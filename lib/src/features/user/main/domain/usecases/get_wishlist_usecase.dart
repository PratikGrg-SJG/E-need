import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/wishlist/wishlist_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/models/common_request_model.dart';

class GetWishlistUsecase
    extends UseCase<List<WishlistResponseModel>, CommonRequestModel> {
  final MainRepository _mainRepository;
  GetWishlistUsecase(this._mainRepository);
  @override
  Future<Either<Failure, List<WishlistResponseModel>>> call(
      CommonRequestModel params) {
    return _mainRepository.getWishlist(params);
  }
}
