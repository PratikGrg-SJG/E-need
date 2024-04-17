import 'package:e_needs/src/core/configs/api_config.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_request_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/register_user_request_model.dart';
import 'package:e_needs/src/services/network/api_handler.dart';

import '../models/login_response_model.dart';
import '../models/register_user_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel registerUserRequestModel);

  Future<LoginResponseModel> loginUser(LoginRequestModel loginRequestModel);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDataSource {
  final ApiHandler _apiHandler;

  AuthRemoteDatasourceImpl(this._apiHandler);
  @override
  Future<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel registerUserRequestModel) async {
    try {
      var response = await _apiHandler.post(
        ApiConfig.userUrl + ApiConfig.createUrl,
        registerUserRequestModel.toJson(),
      );
      return registerUserResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> loginUser(
      LoginRequestModel loginRequestModel) async {
    try {
      var response = await _apiHandler.post(
        "${ApiConfig.loginUrl}",
        loginRequestModel.toJson(),
      );
      return loginResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
