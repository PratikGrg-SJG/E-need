import 'package:dartz/dartz.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_request_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_response_model.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/register_user_request_model.dart';
import '../../data/models/register_user_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterUserResponseModel>> registerUser(
      RegisterUserRequestModel registerUserRequestModel);

      Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel loginRequestModel);
}
