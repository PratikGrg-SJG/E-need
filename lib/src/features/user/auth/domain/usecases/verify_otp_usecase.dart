import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/core/usecase/usecase.dart';
import 'package:e_needs/src/features/user/auth/data/models/verifyOtp_request_model.dart';
import 'package:e_needs/src/features/user/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase extends UseCase<void, VerifyOtpRequestModel> {
  final AuthRepository _authRepository;
  VerifyOtpUseCase(this._authRepository);
  @override
  Future<Either<Failure, void>> call(VerifyOtpRequestModel params) {
    return _authRepository.verifyOtp(params);
  }
}
