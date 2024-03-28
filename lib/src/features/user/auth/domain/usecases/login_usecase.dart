import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_request_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_response_model.dart';
import 'package:e_needs/src/features/user/auth/domain/repositories/auth_repository.dart';

class LoginUsecase extends UseCase<LoginResponseModel, LoginRequestModel> {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);
  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginRequestModel params) {
    return _authRepository.login(params);
  }
}
