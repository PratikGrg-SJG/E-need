import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';

class UpdateProfileUsecase
    extends UseCase<UpdateProfileResponseModel, UpdateProfileRequestModel> {
  final MainRepository _mainRepository;
  UpdateProfileUsecase(this._mainRepository);
  @override
  Future<Either<Failure, UpdateProfileResponseModel>> call(
      UpdateProfileRequestModel params) {
    return _mainRepository.updateProfile(params);
  }
}
