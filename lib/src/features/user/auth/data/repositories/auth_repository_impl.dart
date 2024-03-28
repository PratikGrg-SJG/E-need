import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_request_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_response_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/register_user_request_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/register_user_response_model.dart';
import 'package:e_needs/src/features/user/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, RegisterUserResponseModel>> registerUser(
      RegisterUserRequestModel registerUserRequestModel) async {
    try {
      final response =
          await _authRemoteDataSource.registerUser(registerUserRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return (Left(ApiFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await _authRemoteDataSource.loginUser(loginRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
