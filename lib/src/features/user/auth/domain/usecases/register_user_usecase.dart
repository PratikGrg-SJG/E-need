import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/auth/data/models/register_user_response_model.dart';
import 'package:e_needs/src/features/user/auth/domain/repositories/auth_repository.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../data/models/register_user_request_model.dart';

class RegisterUserUsecase
    extends UseCase<RegisterUserResponseModel, RegisterUserRequestModel> {
  final AuthRepository _authRepository;
  RegisterUserUsecase(this._authRepository);

  @override
  Future<Either<Failure, RegisterUserResponseModel>> call(
      RegisterUserRequestModel params) {
    return _authRepository.registerUser(params);
  }
}
