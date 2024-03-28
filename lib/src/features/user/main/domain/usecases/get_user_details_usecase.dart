import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/models/common_request_model.dart';

import '../../data/models/profile/user_details_response_model.dart';

class GetUserDetailsUsecase extends UseCase<UserDetailsResponseModel, CommonRequestModel> {
  final MainRepository _mainRepository;
  GetUserDetailsUsecase(this._mainRepository);
  @override
  Future<Either<Failure, UserDetailsResponseModel>> call(CommonRequestModel params) {
    return _mainRepository.getUserDetails(params);
  }
}
